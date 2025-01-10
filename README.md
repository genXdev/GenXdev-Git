<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Git
### SYNOPSIS
    A Windows PowerShell module for git related operations
[![GenXdev.Git](https://img.shields.io/powershellgallery/v/GenXdev.Git.svg?style=flat-square&label=GenXdev.Git)](https://www.powershellgallery.com/packages/GenXdev.Git/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Git?style=flat-square)](./LICENSE)

### FEATURES

### DEPENDENCIES
[![WinOS - Windows-10 or later](https://img.shields.io/badge/WinOS-Windows--10--10.0.19041--SP0-brightgreen)](https://www.microsoft.com/en-us/windows/get-windows-10) [![GenXdev.Helpers](https://img.shields.io/powershellgallery/v/GenXdev.Helpers.svg?style=flat-square&label=GenXdev.Helpers)](https://www.powershellgallery.com/packages/GenXdev.Helpers/) [![GenXdev.Webbrowser](https://img.shields.io/powershellgallery/v/GenXdev.Webbrowser.svg?style=flat-square&label=GenXdev.Webbrowser)](https://www.powershellgallery.com/packages/GenXdev.Webbrowser/)
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
| [PermanentlyDeleteGitFolders](#PermanentlyDeleteGitFolders) |  |  |
| [New-GitCommit](#New-GitCommit) | commit |  |
| [Add-LineToREADME](#Add-LineToREADME) |  |  |
| [Add-TodoLineToREADME](#Add-TodoLineToREADME) | todo |  |
| [Todoos](#Todoos) |  |  |
| [Add-IdeaLineToREADME](#Add-IdeaLineToREADME) | idea |  |
| [Ideas](#Ideas) |  |  |
| [Add-IssueLineToREADME](#Add-IssueLineToREADME) | issue |  |
| [Issues](#Issues) |  |  |
| [Add-FeatureLineToREADME](#Add-FeatureLineToREADME) | feature |  |
| [Features](#Features) |  |  |

<br/><hr/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Git<hr/>

##	PermanentlyDeleteGitFolders
````PowerShell
PermanentlyDeleteGitFolders
````

### SYNTAX
````PowerShell
PermanentlyDeleteGitFolders [-RepoUri] <string> [-Folders] <string[]> [<CommonParameters>]
````

### PARAMETERS
    -Folders <string[]>
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -RepoUri <string>
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
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

### SYNTAX
````PowerShell
New-GitCommit [[-title] <string>] [<CommonParameters>]
````

### PARAMETERS
    -title <string>
        Required?                    false
        Position?                    0
        Accept pipeline input?       true (FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
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

### SYNTAX
````PowerShell
Add-LineToREADME [[-Line] <string>] [-Section] <string> [-Prefix] <string> [-Code] [-Show] 
[-Done] [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>]
````

### PARAMETERS
    -Code
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Done
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Line <string>
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Prefix <string>
        Required?                    true
        Position?                    2
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Section <string>
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Show
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -UseHomeREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -UseOneDriveREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
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

### SYNTAX
````PowerShell
Add-TodoLineToREADME [[-Line] <string>] [-Code] [-Show] [-Done] [-UseHomeREADME] 
[-UseOneDriveREADME] [<CommonParameters>]
````

### PARAMETERS
    -Code
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Done
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Line <string>
        Required?                    false
        Position?                    0
        Accept pipeline input?       true (FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Show
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -UseHomeREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -UseOneDriveREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
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

### SYNTAX
````PowerShell
Todoos [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>]
````

### PARAMETERS
    -UseHomeREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -UseOneDriveREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
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

### SYNTAX
````PowerShell
Add-IdeaLineToREADME [[-Line] <string>] [-Code] [-Show] [-UseHomeREADME] 
[-UseOneDriveREADME] [<CommonParameters>]
````

### PARAMETERS
    -Code
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Line <string>
        Required?                    false
        Position?                    0
        Accept pipeline input?       true (FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Show
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -UseHomeREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -UseOneDriveREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Ideas
````PowerShell
Ideas
````

### SYNTAX
````PowerShell
Ideas [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>]
````

### PARAMETERS
    -UseHomeREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -UseOneDriveREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
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

### SYNTAX
````PowerShell
Add-IssueLineToREADME [[-Line] <string>] [-Code] [-Show] [-UseHomeREADME] 
[-UseOneDriveREADME] [<CommonParameters>]
````

### PARAMETERS
    -Code
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Line <string>
        Required?                    false
        Position?                    0
        Accept pipeline input?       true (FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Show
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -UseHomeREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -UseOneDriveREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
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

### SYNTAX
````PowerShell
Issues [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>]
````

### PARAMETERS
    -UseHomeREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -UseOneDriveREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
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

### SYNTAX
````PowerShell
Add-FeatureLineToREADME [[-Line] <string>] [-Code] [-Show] [-UseHomeREADME] 
[-UseOneDriveREADME] [<CommonParameters>]
````

### PARAMETERS
    -Code
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Line <string>
        Required?                    false
        Position?                    0
        Accept pipeline input?       true (FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Show
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -UseHomeREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -UseOneDriveREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
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

### SYNTAX
````PowerShell
Features [-UseHomeREADME] [-UseOneDriveREADME] [<CommonParameters>]
````

### PARAMETERS
    -UseHomeREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -UseOneDriveREADME
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>
