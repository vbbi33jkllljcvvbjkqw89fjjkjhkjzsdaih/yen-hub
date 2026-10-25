param(
	[Parameter(Mandatory = $true)][string]$User,
	[Parameter(Mandatory = $true)][string]$Repo,
	[string]$Branch = "main"
)

$Root = Split-Path -Parent $PSScriptRoot
$Base = "https://raw.githubusercontent.com/$User/$Repo/$Branch/"

$Files = Get-ChildItem $Root -Recurse -Filter "*.lua" | Where-Object { $_.FullName -notmatch "\\Libraries\\" }
$Changed = 0

foreach ($File in $Files) {
	$Text = [System.IO.File]::ReadAllText($File.FullName)

	if ($Text.Contains("YEN_BASE_URL")) {
		[System.IO.File]::WriteAllText($File.FullName, $Text.Replace("YEN_BASE_URL", $Base), (New-Object System.Text.UTF8Encoding $false))
		$Changed++
	}
}

Write-Host "Base url set to $Base in $Changed files"
Write-Host "Loadstring:"
Write-Host "loadstring(game:HttpGet(`"$($Base)Loader.lua`"))()"
