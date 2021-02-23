$Url = 'https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive' 
$ZipFile = './vscode.zip'
$Proxy = '127.0.0.1:1080'

$services = @(Get-Process Code -ErrorAction Ignore)

if ($services.Count -cgt 1) {
  Write-Output '请检查进程Code.exe 还在运行中 .'
  Exit 
} 

if ($Proxy) {
  Invoke-WebRequest -Uri $Url -OutFile $ZipFile -Proxy $Proxy 
} else {
  Invoke-WebRequest -Uri $Url -OutFile $ZipFile
}

Expand-Archive $ZipFile -DestinationPath './' -Force

