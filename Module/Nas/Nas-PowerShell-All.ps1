Write-Output " "
Write-Output " "
Write-Output " NNNNNNNN        NNNNNNNN                                                     "
Write-Output " N:::::::N       N::::::N                                                     "
Write-Output " N::::::::N      N::::::N                                                     "
Write-Output " N:::::::::N     N::::::N                                                     "
Write-Output " N::::::::::N    N::::::N   ooooooooooo   nnnn  nnnnnnnn       ooooooooooo    "
Write-Output " N:::::::::::N   N::::::N oo:::::::::::oo n:::nn::::::::nn   oo:::::::::::oo  "
Write-Output " N:::::::N::::N  N::::::No:::::::::::::::on::::::::::::::nn o:::::::::::::::o "
Write-Output " N::::::N N::::N N::::::No:::::ooooo:::::onn:::::::::::::::no:::::ooooo:::::o "
Write-Output " N::::::N  N::::N:::::::No::::o     o::::o  n:::::nnnn:::::no::::o     o::::o "
Write-Output " N::::::N   N:::::::::::No::::o     o::::o  n::::n    n::::no::::o     o::::o "
Write-Output " N::::::N    N::::::::::No::::o     o::::o  n::::n    n::::no::::o     o::::o "
Write-Output " N::::::N     N:::::::::No::::o     o::::o  n::::n    n::::no::::o     o::::o "
Write-Output " N::::::N      N::::::::No:::::ooooo:::::o  n::::n    n::::no:::::ooooo:::::o "
Write-Output " N::::::N       N:::::::No:::::::::::::::o  n::::n    n::::no:::::::::::::::o "
Write-Output " N::::::N        N::::::N oo:::::::::::oo   n::::n    n::::n oo:::::::::::oo  "
Write-Output " NNNNNNNN         NNNNNNN   ooooooooooo     nnnnnn    nnnnnn   ooooooooooo    "
Write-Output " "
Write-Output " "
Write-Output " "
Write-Output " "
Write-Output " "
Write-Output " "
Write-Output " ################ "
Write-Output " ################ "
Write-Output " ##            ## "
Write-Output " ##  .d8888b.  ## "
Write-Output " ## d88P  Y88b ## "
Write-Output " ##        888 ## "
Write-Output " ##      .d88P ## "
Write-Output " ##  .od888P'' ## "
Write-Output " ## d88P''     ## "
Write-Output " ## 888''      ## "
Write-Output " ## 888888888  ## "
Write-Output " ##            ## "
Write-Output " ################ "
Write-Output " ################ "
Write-Output " ---------------- "
Start-Sleep 1
Write-Output " "
Write-Output " "
Write-Output " ################ "
Write-Output " ################ "
Write-Output " ##            ## "
Write-Output " ##    d888    ## "
Write-Output " ##   d8888    ## "
Write-Output " ##     888    ## "
Write-Output " ##     888.   ## "
Write-Output " ##     888    ## "
Write-Output " ##     888    ## "
Write-Output " ##     888    ## "
Write-Output " ##   8888888  ## "
Write-Output " ##            ## "
Write-Output " ################ "
Write-Output " ################ "
Write-Output " ---------------- "
Start-Sleep 1
Write-Output " "
Write-Output " "
Write-Output " ################ "
Write-Output " ################ "
Write-Output " ##            ## "
Write-Output " ##  .d8888b.  ## "
Write-Output " ## d88P  Y88b ## "
Write-Output " ## 888    888 ## "
Write-Output " ## 888    888 ## "
Write-Output " ## 888    888 ## "
Write-Output " ## 888    888 ## "
Write-Output " ## Y88b  d88P ## "
Write-Output " ##  'Y8888P'  ## "
Write-Output " ##            ## "
Write-Output " ################ "
Write-Output " ################ "
Write-Output " ---------------- "
Start-Sleep 1

#############################
# Connection au Nas de Nono #
#############################

# Mise en Place des Variables
      $pathpwdnas = "$env:USERPROFILE\Documents\Applications\Nas"
      
      $passPathExists = Test-Path -Path "$pathpwdnas\pw.txt"
      If ($passPathExists) {
      Write-Host "Mot de Passe deja enregistre"
      }
      else {
      New-Item -ItemType Directory -Force -Path "$pathpwdnas" | Out-Null 
      $pass = Get-Credential -Message "Il est Indispendable de fournir un Mot de Passe pour pouvoir se connecter au Nas!" -User "Nono"
      $pass.GetNetworkCredential().Password | Out-File "$pathpwdnas\pw.txt"
      $pass.GetNetworkCredential().UserName | Out-File "$pathpwdnas\usr.txt"

      }


      $passPathExists = Test-Path -Path "$pathpwdnas\usr.txt"
      If ($passPathExists) {
      Write-Host "Utilisateur deja enregistre"
      }
      else {
      New-Item -ItemType Directory -Force -Path "$pathpwdnas" | Out-Null 
      $pass = Get-Credential -Message "Il est Indispendable de fournir un Mot de Passe pour pouvoir se connecter au Nas!" -User "Nono"
      $pass.GetNetworkCredential().UserName | Out-File "$pathpwdnas\usr.txt"
      $pass.GetNetworkCredential().Password | Out-File "$pathpwdnas\pw.txt"
      }

      $SmBPwd = Get-Content "$pathpwdnas\pw.txt"
      $SmBUsr = Get-Content "$pathpwdnas\usr.txt"

############################################################################################################################################################################


$Networkpath = "Z:\" 
$pathExists = Test-Path -Path $Networkpath
If ($pathExists)  {
Write-host "Le nas est bien connecte!"
Write-host "il n'y a rien besoin de faire!"
Return      #end the function if path was already there
}
else {
(New-SmbMapping -LocalPath 'Z:' -RemotePath '\\192.168.1.54\web' -UserName $SmBUsr -Password $SmBPwd -Persistent $false -ErrorAction SilentlyContinue)
    Start-Sleep 2

}    
$pathExists = Test-Path -Path $Networkpath
If (-not ($pathExists)) {
New-SmbMapping -LocalPath 'Z:' -RemotePath '\\nonobouli.myDS.me\web' -UserName $SmBUsr -Password $SmBPwd -Persistent $false -ErrorAction SilentlyContinue 
    Start-Sleep 2

}
ELSE {
    Start-Sleep 2
}


############################################################################################################################################################################


$Networkpath = "Y:\" 
$pathExists = Test-Path -Path $Networkpath
If ($pathExists)  {
Write-host "Le nas est bien connecte!"
Write-host "il n'y a rien besoin de faire!"
Return      #end the function if path was already there
}
else {
(New-SmbMapping -LocalPath 'Y:' -RemotePath '\\192.168.1.54\video' -UserName $SmBUsr -Password $SmBPwd -Persistent $false -ErrorAction SilentlyContinue)
    Start-Sleep 1
}    
$pathExists = Test-Path -Path $Networkpath
If (-not ($pathExists)) {
New-SmbMapping -LocalPath 'Y:' -RemotePath '\\nonobouli.myDS.me\video' -UserName $SmBUsr -Password $SmBPwd -Persistent $false -ErrorAction SilentlyContinue 
    Start-Sleep 1
}
ELSE {
    Start-Sleep 1
}


############################################################################################################################################################################


$Networkpath = "X:\" 
$pathExists = Test-Path -Path $Networkpath
If ($pathExists)  {
Write-host "Paths existent déjà!"
Write-host "il n'y a rien besoin de faire!"
Return      #end the function if path was already there
}
else {
(New-SmbMapping -LocalPath 'X:' -RemotePath '\\192.168.1.54\photo' -UserName $SmBUsr -Password $SmBPwd -Persistent $false -ErrorAction SilentlyContinue)
    Start-Sleep 1
}    
$pathExists = Test-Path -Path $Networkpath
If (-not ($pathExists)) {
New-SmbMapping -LocalPath 'X:' -RemotePath '\\nonobouli.myDS.me\photo' -UserName $SmBUsr -Password $SmBPwd -Persistent $false -ErrorAction SilentlyContinue 
    Start-Sleep 1
}
ELSE {
    Start-Sleep 1
}


############################################################################################################################################################################


$Networkpath = "W:\" 
$pathExists = Test-Path -Path $Networkpath
If ($pathExists)  {
Write-host "Paths existent déjà!"
Write-host "il n'y a rien besoin de faire!"
Return      #end the function if path was already there
}
else {
(New-SmbMapping -LocalPath 'W:' -RemotePath '\\192.168.1.54\Nono-Perso' -UserName $SmBUsr -Password $SmBPwd -Persistent $false -ErrorAction SilentlyContinue)
    Start-Sleep 1
}    
$pathExists = Test-Path -Path $Networkpath
If (-not ($pathExists)) {
New-SmbMapping -LocalPath 'W:' -RemotePath '\\nonobouli.myDS.me\Nono-Perso' -UserName $SmBUsr -Password $SmBPwd -Persistent $false -ErrorAction SilentlyContinue 
    Start-Sleep 1
}
ELSE {
    Start-Sleep 1
}


############################################################################################################################################################################


$Networkpath = "V:\" 
$pathExists = Test-Path -Path $Networkpath
If ($pathExists)  {
Write-host "Paths existent déjà!"
Write-host "il n'y a rien besoin de faire!"
Return      #end the function if path was already there
}
else {
(New-SmbMapping -LocalPath 'V:' -RemotePath '\\192.168.1.54\music' -UserName $SmBUsr -Password $SmBPwd -Persistent $false -ErrorAction SilentlyContinue)
    Start-Sleep 1
}    
$pathExists = Test-Path -Path $Networkpath
If (-not ($pathExists)) {
New-SmbMapping -LocalPath 'V:' -RemotePath '\\nonobouli.myDS.me\music' -UserName $SmBUsr -Password $SmBPwd -Persistent $false -ErrorAction SilentlyContinue 
    Start-Sleep 1
}
ELSE {
    Start-Sleep 1
}


############################################################################################################################################################################


$Networkpath = "U:\" 
$pathExists = Test-Path -Path $Networkpath
If ($pathExists)  {
Write-host "Paths existent déjà!"
Write-host "il n'y a rien besoin de faire!"
Return      #end the function if path was already there
}
else {
(New-SmbMapping -LocalPath 'U:' -RemotePath '\\192.168.1.54\Downloads' -UserName $SmBUsr -Password $SmBPwd -Persistent $false -ErrorAction SilentlyContinue)
    Start-Sleep 1
}    
$pathExists = Test-Path -Path $Networkpath
If (-not ($pathExists)) {
New-SmbMapping -LocalPath 'U:' -RemotePath '\\nonobouli.myDS.me\Downloads' -UserName $SmBUsr -Password $SmBPwd -Persistent $false -ErrorAction SilentlyContinue 
    Start-Sleep 1
}
ELSE {
    Start-Sleep 1
}


############################################################################################################################################################################


$Networkpath = "T:\" 
$pathExists = Test-Path -Path $Networkpath
If ($pathExists)  {
Write-host "Paths existent déjà!"
Write-host "il n'y a rien besoin de faire!"
Return      #end the function if path was already there
}
else {
(New-SmbMapping -LocalPath 'T:' -RemotePath '\\192.168.1.54\Backup' -UserName $SmBUsr -Password $SmBPwd -Persistent $false -ErrorAction SilentlyContinue)
    Start-Sleep 1
}    
$pathExists = Test-Path -Path $Networkpath
If (-not ($pathExists)) {
New-SmbMapping -LocalPath 'T:' -RemotePath '\\nonobouli.myDS.me\Backup' -UserName $SmBUsr -Password $SmBPwd -Persistent $false -ErrorAction SilentlyContinue 
    Start-Sleep 1
}
ELSE {
    Start-Sleep 1
}


############################################################################################################################################################################


$Networkpath = "S:\" 
$pathExists = Test-Path -Path $Networkpath
If ($pathExists)  {
Write-host "Paths existent déjà!"
Write-host "il n'y a rien besoin de faire!"
Return      #end the function if path was already there
}
else {
(New-SmbMapping -LocalPath 'S:' -RemotePath '\\192.168.1.54\web_packages' -UserName $SmBUsr -Password $SmBPwd -Persistent $false -ErrorAction SilentlyContinue)
    Start-Sleep 1
}    
$pathExists = Test-Path -Path $Networkpath
If (-not ($pathExists)) {
New-SmbMapping -LocalPath 'S:' -RemotePath '\\nonobouli.myDS.me\web_packages' -UserName $SmBUsr -Password $SmBPwd -Persistent $false -ErrorAction SilentlyContinue 
    Start-Sleep 1
}
ELSE {
    Start-Sleep 1
}


############################################################################################################################################################################
