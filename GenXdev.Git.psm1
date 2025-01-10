function PermanentlyDeleteGitFolders {

    [CmdletBinding()]

    param(

        [parameter(
            Position = 0,
            Mandatory
        )]
        [string] $RepoUri,

        [parameter(
            Position = 1,
            Mandatory
        )]
        [string[]] $Folders
    )

    $TempPath = "$Env:TEMP\$([datetime]::UtcNow.Ticks)"

    [IO.Directory]::CreateDirectory($TempPath)

    Push-Location
    try {

        Set-Location $TempPath

        # Make a fresh clone of YOUR_REPO
        git clone $RepoUri repo

        Set-Location repo

        # Create tracking branches of all branches
        git branch -r | ForEach-Object {

            if ($PSItem.Contains("/HEAD") -eq $false) {

                git checkout --track $PSItem.Trim()
            }

            # Remove DIRECTORY_NAME from all commits, then remove the refs to the old commits
            # (repeat these two commands for as many directories that you want to remove)
            foreach ($folder in $folders) {

                $folderFixed = $folder.replace("\", "/");
                if ($folderFixed.endswith("/")) {

                    $folderFixed = $folderFixed.Substring(0, $folderFixed.Length - 1);
                }

                git "filter-branch" "--index-filter" "'git rm -rf --cached --ignore-unmatch $folderFixed/'" "--prune-empty" "--tag-name-filter" "cat" "--" "--all"
                git "for-each-ref" "--format=`"%(refname)`"" "refs/original/" | Select-Object -First 1 | ForEach-Object {

                    git update-ref -d
                }
            }

            try {
                # Ensure all old refs are fully removed
                Get-ChildItem @(".git/logs", ".git/refs/original") -ErrorAction SilentlyContinue -Directory | ForEach-Object -ErrorAction SilentlyContinue {

                    Remove-Item -LiteralPath "$($PSItem.FullName)" -Force -Recurse -ErrorAction SilentlyContinue
                    Remove-Item -LiteralPath "$($PSItem.FullName)" -Force -Recurse -ErrorAction SilentlyContinue
                }
            }
            Catch {

            }

            # Perform a garbage collection to remove commits with no refs
            git gc "--prune=all" "--aggressive"

            # Force push all branches to overwrite their history
            # (use with caution!)
            git push origin "--all" "--force"
            git push origin "--tags" "--force"
        }
    }
    finally {

        Pop-Location
    }
}

###############################################################################

function New-GitCommit {

    [CmdletBinding()]
    [Alias("commit")]

    param(
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments
        )]
        [string] $title = "Improved scripts"
    )

    $branch = (git symbolic-ref refs/remotes/origin/HEAD).split("/")[3]

    git add *

    if ($? -eq $false) { return }

    git commit -m "$title"

    if ($? -eq $false) { return }

    git push -u origin $branch

    if ($? -eq $false) { return }

    git push
}

###############################################################################

function Add-LineToREADME {

    [CmdletBinding()]

    param(

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $Code,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $Show,

        [Parameter(Position = 0, ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [string] $Line = "",

        [Parameter(Position = 1, ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory)]
        [string] $Section,

        [Parameter(Position = 2, ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory)]
        [string] $Prefix = "* ",

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $Done,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseHomeREADME,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseOneDriveREADME
    )

    Begin {

        function findReadMePath([string] $startDir) {

            $startDir = Expand-Path $startDir

            Push-Location
            try {
                Set-Location $startDir

                do {

                    if ([IO.File]::Exists("$pwd\README.md")) {

                        return "$pwd\README.md"
                    }

                    Set-Location ..
                }
                while (($startDir.Length -ge 2) -and ($startDir -ne $PWD))
            }
            finally {

                Pop-Location
            }

            return "$((Expand-Path -FilePath "~\Onedrive\README.md" -CreateDirectory))";
        }

        if ($UseHomeREADME -eq $true) {

            $readmePath = Expand-Path -FilePath "$([IO.Path]::GetDirectoryName($Profile))\README.md";
        }
        elseif ($UseOneDriveREADME -eq $true) {

            $readmePath = Expand-Path -FilePath "~\Onedrive\README.md" -CreateDirectory
        }
        else {

            $readmePath = findReadMePath $PWD
        }

        Write-Verbose "Readme path: $readmePath"

        if (![IO.File]::Exists($readmePath)) {

            throw "file not found for: $readmePath"
        }

        $readme = [IO.File]::ReadAllText($readmePath);
        [int] $insertIndex = $readme.IndexOf("$Section");

        if ($insertIndex -lt 0) {

            $insertIndex = 0;
            $readme = "$Section`r`n`r`n$readme"
        }

        $insertIndex += "$Section`r".Length;
    }

    Process {

        if ([string]::IsNullOrWhiteSpace($Line) -eq $false) {

            if ($done -eq $true) {

                $readme = $readme.Replace("$prefix$Line`r`n", "- [✅] $($Line.Trim())`r`n");
            }
            else {

                $readme = $readme.Substring(0, $insertIndex) + "$prefix$Line`r`n" + $readme.Substring($insertIndex);
            }
        }
    }

    END {

        [IO.File]::WriteAllText($readmePath, $readme);

        if ($code -eq $true) {

            $c = (Get-Command "code.cmd" -ErrorAction silentlycontinue);

            if (($code -eq $true) -and ($c -is [System.Object]) -and ($null -ne $c) -and ($c.length -gt 0)) {

                cmd.exe /c code.cmd $readmePath
            }
        }

        if ($show -eq $true) {

            $readmeMarkDown = "";
            $inSection = $false;

            $ansiColorStart = [char]27 + "["
            $ansiColorYellow = "${ansiColorStart}33m"
            $ansiBackgroundColorBlue = "${ansiColorStart}44m"
            $ansiColorReset = "${ansiColorStart}0m"

            foreach ($readmeLine in [IO.File]::ReadAllLines($readmePath)) {

                if ($readmeLine.StartsWith($Section)) {

                    $inSection = $true;
                    $readmeMarkDown = "$ansiBackgroundColorBlue$ansiColorYellow$readmeMarkDown$($readmeLine.trim("`r`n`t "))$ansiColorReset`r`n`r`n"
                }
                else {
                    if ($inSection) {

                        if ($readmeLine.StartsWith("#")) {

                            break;
                        }
                        $readmeMarkDown = "$readmeMarkDown$($readmeLine.trim("`r`n`t "))`r`n`r`n"
                    }
                }
            }

            # Show-Markdown -InputObject $readmeMarkDown
            $readmeMarkDown
        }
    }
}

###############################################################################

function Add-TodoLineToREADME {

    [CmdletBinding()]
    [Alias("todo")]

    param(
        [Parameter(Position = 0, ValueFromPipeline = $false, ValueFromRemainingArguments, Mandatory = $false)]
        [string] $Line = "",

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $Code,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $Show,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $Done,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseHomeREADME,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseOneDriveREADME
    )

    if ([string]::IsNullOrWhiteSpace($Line) -eq $false) {

        if ($done -ne $true) {
            $line = "$([Datetime]::Now.Tostring("yyyyMMdd")) --> $line"
        }
    }

    Add-LineToREADME -Code:$Code -Show:$Show -Section "## Todoos" -Prefix "- [ ] " -Line $Line -Done:$Done -UseHomeREADME:$UseHomeREADME -UseOneDriveREADME:$UseOneDriveREADME
}

function Todoos {

    param(
        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseHomeREADME,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseOneDriveREADME
    )

    Add-TodoLineToREADME -Show -UseHomeREADME:$UseHomeREADME -UseOneDriveREADME:$UseOneDriveREADME
}

###############################################################################

function Add-IdeaLineToREADME {

    [CmdletBinding()]
    [Alias("idea")]

    param(
        [Parameter(Position = 0, ValueFromPipeline = $false, ValueFromRemainingArguments, Mandatory = $false)]
        [string] $Line = "",

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $Code,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $Show,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseHomeREADME,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseOneDriveREADME
    )

    if ([string]::IsNullOrWhiteSpace($Line) -eq $false) {

        $line = "$([Datetime]::Now.Tostring("yyyyMMdd")) --> $line"
    }

    Add-LineToREADME -Code:$Code -Show:$Show -Section "## Ideas" -Prefix "- [ ] " -Line $Line -UseHomeREADME:$UseHomeREADME -UseOneDriveREADME:$UseOneDriveREADME
}

function Ideas {

    param(
        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseHomeREADME,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseOneDriveREADME
    )

    Add-IdeaLineToREADME -Show -UseHomeREADME:$UseHomeREADME -UseOneDriveREADME:$UseOneDriveREADME
}
###############################################################################

function Add-IssueLineToREADME {

    [CmdletBinding()]
    [Alias("issue")]

    param(
        [Parameter(Position = 0, ValueFromPipeline = $false, ValueFromRemainingArguments, Mandatory = $false)]
        [string] $Line = "",

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $Code,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $Show,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseHomeREADME,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseOneDriveREADME
    )

    if ([string]::IsNullOrWhiteSpace($Line) -eq $false) {

        $line = "$([Datetime]::Now.Tostring("yyyyMMdd")) --> $line"
    }

    Add-LineToREADME -Code:$Code -Show:$Show -Section "## Issues" -Prefix "- [ ] " -Line $Line -UseHomeREADME:$UseHomeREADME -UseOneDriveREADME:$UseOneDriveREADME
}
function Issues {

    param(
        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseHomeREADME,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseOneDriveREADME
    )

    Add-IssueLineToREADME -Show -UseHomeREADME:$UseHomeREADME -UseOneDriveREADME:$UseOneDriveREADME
}
###############################################################################

function Add-FeatureLineToREADME {

    [CmdletBinding()]
    [Alias("feature")]

    param(
        [Parameter(Position = 0, ValueFromPipeline = $false, ValueFromRemainingArguments, Mandatory = $false)]
        [string] $Line = "",

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $Code,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $Show,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseHomeREADME,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseOneDriveREADME
    )

    if ([string]::IsNullOrWhiteSpace($Line) -eq $false) {

        $line = "$([Datetime]::Now.Tostring("yyyyMMdd")) --> $line"
    }

    Add-LineToREADME -Code:$Code -Show:$Show -Section "## Features" -Prefix "- [X] " -Line $Line -UseHomeREADME:$UseHomeREADME -UseOneDriveREADME:$UseOneDriveREADME
}

function Features {

    param(
        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseHomeREADME,

        [Parameter(ValueFromPipeline = $false, ValueFromRemainingArguments = $false, Mandatory = $false)]
        [switch] $UseOneDriveREADME
    )

    Add-FeatureLineToREADME -Show -UseHomeREADME:$UseHomeREADME -UseOneDriveREADME:$UseOneDriveREADME
}

################################################################################
