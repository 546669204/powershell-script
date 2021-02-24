# 批量查找没有git并且没有远程地址的目录
$dirs = @(Get-ChildItem -Name);

foreach ($dir in $dirs) {
  Push-Location -Path $dir
  if (Test-Path ".git") {
    $ret = @(Invoke-Expression "git remote -v" -ErrorAction Ignore)
    if ($ret.Count -cge 2) {
      Pop-Location
      continue;
    }
  }
  Pop-Location
  Write-Output $dir;
}
