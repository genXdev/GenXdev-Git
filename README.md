<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Git
### SYNOPSIS
    A Windows PowerShell module for git related operations
[![GenXdev.Git](https://img.shields.io/powershellgallery/v/GenXdev.Git.svg?style=flat-square&label=GenXdev.Git)](https://www.powershellgallery.com/packages/GenXdev.Git/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Git?style=flat-square)](./LICENSE)

### DEPRICATED/MOVED
This module has been moved to GenXdev.Coding as a sub-module named GenXdev.Coding.Git

### DEPENDENCIES
[![WinOS - Windows-10 or later](https://img.shields.io/badge/WinOS-Windows--10--10.0.19041--SP0-brightgreen)](https://www.microsoft.com/en-us/windows/get-windows-10)  [![GenXdev.Data](https://img.shields.io/powershellgallery/v/GenXdev.Data.svg?style=flat-square&label=GenXdev.Data)](https://www.powershellgallery.com/packages/GenXdev.Data/) [![GenXdev.Helpers](https://img.shields.io/powershellgallery/v/GenXdev.Helpers.svg?style=flat-square&label=GenXdev.Helpers)](https://www.powershellgallery.com/packages/GenXdev.Helpers/) [![GenXdev.Webbrowser](https://img.shields.io/powershellgallery/v/GenXdev.Webbrowser.svg?style=flat-square&label=GenXdev.Webbrowser)](https://www.powershellgallery.com/packages/GenXdev.Webbrowser/)
### INSTALLATION
````PowerShell
Install-Module "GenXdev.Git"
Import-Module "GenXdev.Git"
````
### UPDATE
````PowerShell
Update-Module
````
<br/><hr/><hr/><br/>

# Cmdlet Index
### GenXdev.Git<hr/>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Add-FeatureLineToREADME](#Add-FeatureLineToREADME) | feature | Adds a feature line to the specified README file, prefixed with the current datein yyyyMMdd format. The line can be formatted as code and optionally displayed. |
| [Add-IdeaLineToREADME](#Add-IdeaLineToREADME) | idea | Adds a timestamped idea to the "## Ideas" section of a README.md file.Can display the modified section and open in Visual Studio Code. |
| [Add-IssueLineToREADME](#Add-IssueLineToREADME) | issue | Adds a timestamped issue to the "## Issues" section of a README.md file.Can display the modified section and open in Visual Studio Code. |
| [Add-LineToREADME](#Add-LineToREADME) |  | Finds and modifies a README.md file by adding a new line to a specified section.Can create the section if it doesn't exist. Supports formatting lines as codeblocks and showing the modified section.Will look in current directory first, then walk up directories to find the READMElocation. If not found, will use the README in the PowerShell profile directory. |
| [Add-TodoLineToREADME](#Add-TodoLineToREADME) | todo | Adds a timestamped todo item to the "## Todoos" section of a README.md file.The todo items can be marked as done and the modified section can be displayed.Each new todo item is automatically timestamped unless marking as done. |
| [Features](#Features) |  | Shows all features from the "## Features" section of a README.md file. Can useeither the README in the current location, PowerShell profile directory, orOneDrive directory. |
| [Ideas](#Ideas) |  | Shows all ideas from the "## Ideas" section of a README.md file. Can use eitherthe README in the current location, PowerShell profile directory, or OneDrivedirectory. |
| [Issues](#Issues) |  | Shows all issues from the "## Issues" section of a README.md file. Can useeither the README in the current location, PowerShell profile directory, orOneDrive directory. |
| [New-GitCommit](#New-GitCommit) | commit | Adds all changes, creates a commit with the specified title, and pushes to thecurrent branch's remote origin. |
| [PermanentlyDeleteGitFolders](#PermanentlyDeleteGitFolders) |  | Clones a repository, removes specified folders from all branches and commits,then force pushes the changes back to origin. This permanently removes thefolders from Git history. |
| [Todoos](#Todoos) |  | Shows all todo items from the "## Todoos" section of a README.md file. Can useeither the README in the current location, PowerShell profile directory, orOneDrive directory. |

<br/><hr/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Git<hr/>

##	Ideas
````PowerShell

   Ideas
````

### SYNOPSIS
    Displays ideas from a README.md file.

### SYNTAX
````PowerShell

   Ideas [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>]
````

### DESCRIPTION
    Shows all ideas from the "## Ideas" section of a README.md file. Can use either
    the README in the current location, PowerShell profile directory, or OneDrive
    directory.

### PARAMETERS
    -UseHomeREADME [<SwitchParameter>]
        Use README.md from PowerShell profile directory instead of current location.
        Required?                    false
        Position?                    1
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -UseOneDriveREADME [<SwitchParameter>]
        Use README.md from OneDrive directory instead of current location.
        Required?                    false
        Position?                    2
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Issues
````PowerShell

   Issues
````

### SYNOPSIS
    Displays issues from a README.md file.

### SYNTAX
````PowerShell

   Issues [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>]
````

### DESCRIPTION
    Shows all issues from the "## Issues" section of a README.md file. Can use
    either the README in the current location, PowerShell profile directory, or
    OneDrive directory.

### PARAMETERS
    -UseHomeREADME [<SwitchParameter>]
        Use README.md from PowerShell profile directory instead of current location.
        Required?                    false
        Position?                    1
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -UseOneDriveREADME [<SwitchParameter>]
        Use README.md from OneDrive directory instead of current location.
        Required?                    false
        Position?                    2
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Todoos
````PowerShell

   Todoos
````

### SYNOPSIS
    Displays todo items from a README.md file.

### SYNTAX
````PowerShell

   Todoos [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>]
````

### DESCRIPTION
    Shows all todo items from the "## Todoos" section of a README.md file. Can use
    either the README in the current location, PowerShell profile directory, or
    OneDrive directory.

### PARAMETERS
    -UseHomeREADME [<SwitchParameter>]
        Use README.md from PowerShell profile directory instead of current location.
        Required?                    false
        Position?                    1
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -UseOneDriveREADME [<SwitchParameter>]
        Use README.md from OneDrive directory instead of current location.
        Required?                    false
        Position?                    2
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Features
````PowerShell

   Features
````

### SYNOPSIS
    Displays features from a README.md file.

### SYNTAX
````PowerShell

   Features [[-UseHomeREADME]] [[-UseOneDriveREADME]] [<CommonParameters>]
````

### DESCRIPTION
    Shows all features from the "## Features" section of a README.md file. Can use
    either the README in the current location, PowerShell profile directory, or
    OneDrive directory.

### PARAMETERS
    -UseHomeREADME [<SwitchParameter>]
        Use README.md from PowerShell profile directory instead of current location.
        Required?                    false
        Position?                    1
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -UseOneDriveREADME [<SwitchParameter>]
        Use README.md from OneDrive directory instead of current location.
        Required?                    false
        Position?                    2
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	New-GitCommit
````PowerShell

   New-GitCommit                        --> commit
````

### SYNOPSIS
    Creates and pushes a new git commit with all changes.

### SYNTAX
````PowerShell

   New-GitCommit [[-Title] <String>] [<CommonParameters>]
````

### DESCRIPTION
    Adds all changes, creates a commit with the specified title, and pushes to the
    current branch's remote origin.

### PARAMETERS
    -Title <String>
        The commit message title to use. Defaults to "Improved scripts".
        Required?                    false
        Position?                    1
        Default value                Improved scripts
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Add-LineToREADME
````PowerShell

   Add-LineToREADME
````

### SYNOPSIS
    Adds a line to a README.md markdown file in a specified section.

### SYNTAX
````PowerShell

   Add-LineToREADME [[-Line] <String>] [-Section] <String> [-Prefix] <String> [-Code] [-Show] [-Done] [-UseHomeREADME]
   [-UseOneDriveREADME] [<CommonParameters>]
````

### DESCRIPTION
    Finds and modifies a README.md file by adding a new line to a specified section.
    Can create the section if it doesn't exist. Supports formatting lines as code
    blocks and showing the modified section.
    Will look in current directory first, then walk up directories to find the README
    location. If not found, will use the README in the PowerShell profile directory.

### PARAMETERS
    -Line <String>
        The line of text to add to the README file.
        Required?                    false
        Position?                    1
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -Section <String>
        The section header where the line should be added.
        Required?                    true
        Position?                    2
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -Prefix <String>
        The prefix to add before the line (default: "* ").
        Required?                    true
        Position?                    3
        Default value                *
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -Code [<SwitchParameter>]
        Switch to open the README in Visual Studio Code after modification.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -Show [<SwitchParameter>]
        Switch to display the modified section after changes.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -Done [<SwitchParameter>]
        Switch to mark a todo item as completed.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -UseHomeREADME [<SwitchParameter>]
        Switch to use README in PowerShell profile directory.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -UseOneDriveREADME [<SwitchParameter>]
        Switch to use README in OneDrive directory.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Add-IdeaLineToREADME
````PowerShell

   Add-IdeaLineToREADME                 --> idea
````

### SYNOPSIS
    Adds an idea item to the README.md file.

### SYNTAX
````PowerShell

   Add-IdeaLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>]
````

### DESCRIPTION
    Adds a timestamped idea to the "## Ideas" section of a README.md file.
    Can display the modified section and open in Visual Studio Code.

### PARAMETERS
    -Line <String>
        The idea text to add. Will be prefixed with current date if not empty.
        Required?                    false
        Position?                    1
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -Code [<SwitchParameter>]
        Opens the README in Visual Studio Code after modification.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -Show [<SwitchParameter>]
        Displays the modified section after changes.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -UseHomeREADME [<SwitchParameter>]
        Uses README in PowerShell profile directory instead of current location.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -UseOneDriveREADME [<SwitchParameter>]
        Uses README in OneDrive directory instead of current location.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Add-TodoLineToREADME
````PowerShell

   Add-TodoLineToREADME                 --> todo
````

### SYNOPSIS
    Adds a todo item to the README.md file.

### SYNTAX
````PowerShell

   Add-TodoLineToREADME [[-Line] <String>] [-Code] [-Show] [-Done] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>]
````

### DESCRIPTION
    Adds a timestamped todo item to the "## Todoos" section of a README.md file.
    The todo items can be marked as done and the modified section can be displayed.
    Each new todo item is automatically timestamped unless marking as done.

### PARAMETERS
    -Line <String>
        The todo item text to add. Will be prefixed with current date if not empty.
        Required?                    false
        Position?                    1
        Default value
        Accept pipeline input?       true (ByValue)
        Aliases
        Accept wildcard characters?  false
    -Code [<SwitchParameter>]
        Opens the README in Visual Studio Code after modification.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -Show [<SwitchParameter>]
        Displays the modified section after changes.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -Done [<SwitchParameter>]
        Marks the specified todo item as completed.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -UseHomeREADME [<SwitchParameter>]
        Uses README in PowerShell profile directory instead of current location.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -UseOneDriveREADME [<SwitchParameter>]
        Uses README in OneDrive directory instead of current location.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Add-IssueLineToREADME
````PowerShell

   Add-IssueLineToREADME                --> issue
````

### SYNOPSIS
    Adds an issue item to the README.md file.

### SYNTAX
````PowerShell

   Add-IssueLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>]
````

### DESCRIPTION
    Adds a timestamped issue to the "## Issues" section of a README.md file.
    Can display the modified section and open in Visual Studio Code.

### PARAMETERS
    -Line <String>
        The issue text to add. Will be prefixed with current date if not empty.
        Required?                    false
        Position?                    1
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -Code [<SwitchParameter>]
        Opens the README in Visual Studio Code after modification.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -Show [<SwitchParameter>]
        Displays the modified section after changes.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -UseHomeREADME [<SwitchParameter>]
        Uses README in PowerShell profile directory instead of current location.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -UseOneDriveREADME [<SwitchParameter>]
        Uses README in OneDrive directory instead of current location.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Add-FeatureLineToREADME
````PowerShell

   Add-FeatureLineToREADME              --> feature
````

### SYNOPSIS
    Adds a feature line to the README file with a timestamp.

### SYNTAX
````PowerShell

   Add-FeatureLineToREADME [[-Line] <String>] [-Code] [-Show] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>]
````

### DESCRIPTION
    Adds a feature line to the specified README file, prefixed with the current date
    in yyyyMMdd format. The line can be formatted as code and optionally displayed.

### PARAMETERS
    -Line <String>
        The feature description text to add to the README file.
        Required?                    false
        Position?                    1
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -Code [<SwitchParameter>]
        Switch to format the line as code in the README file.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -Show [<SwitchParameter>]
        Switch to display the README file after adding the line.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -UseHomeREADME [<SwitchParameter>]
        Switch to use the README file in the home directory.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -UseOneDriveREADME [<SwitchParameter>]
        Switch to use the README file in the OneDrive directory.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	PermanentlyDeleteGitFolders
````PowerShell

   PermanentlyDeleteGitFolders
````

### SYNOPSIS
    Permanently deletes specified folders from all branches in a Git repository.

### SYNTAX
````PowerShell

   PermanentlyDeleteGitFolders [-RepoUri] <String> [-Folders] <String[]> [<CommonParameters>]
````

### DESCRIPTION
    Clones a repository, removes specified folders from all branches and commits,
    then force pushes the changes back to origin. This permanently removes the
    folders from Git history.

### PARAMETERS
    -RepoUri <String>
        The URI of the Git repository to clean.
        Required?                    true
        Position?                    1
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    -Folders <String[]>
        Array of folder paths to permanently remove from the repository history.
        Required?                    true
        Position?                    2
        Default value
        Accept pipeline input?       false
        Aliases
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>
