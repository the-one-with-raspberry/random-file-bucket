param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}
iwr 'https://raw.githubusercontent.com/the-one-with-raspberry/random-file-bucket/main/koth_orangebridge.bsp' -OutFile 'C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf\maps\koth_orangebridge.bsp'
