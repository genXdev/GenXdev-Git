################################################################################
<#
.SYNOPSIS
Permanently deletes specified folders from all branches in a Git repository.

.DESCRIPTION
Clones a repository, removes specified folders from all branches and commits,
then force pushes the changes back to origin. This permanently removes the
folders from Git history.

.PARAMETER RepoUri
The URI of the Git repository to clean.

.PARAMETER Folders
Array of folder paths to permanently remove from the repository history.

.EXAMPLE
PermanentlyDeleteGitFolders -RepoUri "https://github.com/user/repo.git" `
    -Folders "bin", "obj"
#>
function PermanentlyDeleteGitFolders {

    [CmdletBinding()]
    param(
        #######################################################################
        [parameter(
            Position = 0,
            Mandatory = $true,
            HelpMessage = "The URI of the Git repository to clean"
        )]
        [string] $RepoUri,
        #######################################################################
        [parameter(
            Position = 1,
            Mandatory = $true,
            HelpMessage = "Array of folder paths to permanently remove"
        )]
        [string[]] $Folders
        #######################################################################
    )

    begin {

        # create a unique temporary directory using utc ticks
        $tempPath = "$Env:TEMP\$([datetime]::UtcNow.Ticks)"
        Write-Verbose "Using temp directory: $tempPath"

        # ensure temp directory exists
        [System.IO.Directory]::CreateDirectory($tempPath)

        # store current location to restore later
        Push-Location
    }

    process {

        try {
            # change to temp directory
            Set-Location $tempPath
            Write-Verbose "Changed to temp directory"

            # clone the repository
            Write-Verbose "Cloning repository: $RepoUri"
            $null = git clone $RepoUri repo

            # change to repo directory
            Set-Location repo
            Write-Verbose "Changed to repository directory"

            # create tracking branches for all remote branches except HEAD
            Write-Verbose "Creating tracking branches"
            git branch -r | ForEach-Object {

                if (-not $PSItem.Contains("/HEAD")) {
                    $null = git checkout --track $PSItem.Trim()
                }

                # process each folder to remove
                foreach ($folder in $Folders) {

                    # normalize folder path to use forward slashes
                    $folderFixed = $folder.replace("\", "/")
                    if ($folderFixed.endswith("/")) {
                        $folderFixed = $folderFixed.Substring(0, $folderFixed.Length - 1)
                    }

                    # remove folder from git history
                    Write-Verbose "Removing $folderFixed from history"
                    git "filter-branch" "--index-filter" `
                        "'git rm -rf --cached --ignore-unmatch $folderFixed/'" `
                        "--prune-empty" "--tag-name-filter" "cat" "--" "--all"

                    # clean up refs
                    git "for-each-ref" "--format=`"%(refname)`"" "refs/original/" |
                        Select-Object -First 1 |
                        ForEach-Object {
                            git update-ref -d
                        }
                }

                try {
                    # remove old refs and logs
                    Get-ChildItem @(".git/logs", ".git/refs/original") `
                        -ErrorAction SilentlyContinue -Directory |
                        ForEach-Object -ErrorAction SilentlyContinue {
                            Remove-Item -LiteralPath $PSItem.FullName -Force -Recurse `
                                -ErrorAction SilentlyContinue
                        }
                }
                catch {
                    Write-Verbose "Error cleaning up refs (non-critical): $_"
                }

                # garbage collect to remove unreferenced commits
                Write-Verbose "Running garbage collection"
                $null = git gc "--prune=all" "--aggressive"

                # force push changes to remote
                Write-Verbose "Force pushing changes to remote"
                $null = git push origin "--all" "--force"
                $null = git push origin "--tags" "--force"
            }
        }
        finally {
            # restore original location
            Pop-Location
            Write-Verbose "Restored original location"
        }
    }

    end {
    }
}
