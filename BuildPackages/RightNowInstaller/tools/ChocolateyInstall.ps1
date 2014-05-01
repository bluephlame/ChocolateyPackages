try {
    $scriptDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
    $installerFile = Join-Path $scriptDir 'rightnow.au3'

	$ie = new-object -comobject "InternetExplorer.Application" 
	$ie.navigate("https://installer-compassionau--tst.custhelp.com/RightNow.Installer.application?launch=https://compassionau--tst.custhelp.com/cgi-bin/compassionau.cfg&dbname=compassionau__tst&trace=true&lang=en_AU")
    
    write-host "Installing RightNow with AutoIt3 using `'$installerFile`'"
    $installArgs = "/c autoit3 `"$installerFile`" "
    Start-ChocolateyProcessAsAdmin "$installArgs" 'cmd.exe'

    Write-ChocolateySuccess 'RightNowInstaller'
} catch {
  Write-ChocolateyFailure 'RightNowInstaller' $($_.Exception.Message)
  throw
}