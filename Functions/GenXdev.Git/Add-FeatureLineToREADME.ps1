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
