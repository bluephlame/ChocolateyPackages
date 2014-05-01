Opt('WinDetectHiddenText', 1)
;Path and filename of the installer executable
;$APPTOINSTALL="""" & $CmdLine[1] & """"
;Run($APPTOINSTALL)
;If @error <> 0  Then 
;	MsgBox(0, "Run failed", "The ""Run"" command failed for " & $APPTOINSTALL & " /S - exiting", 5)
;	Exit
;EndIf

;Wait for the installation to complete and the dialog to appear, close the window
$DEFAULTWAITTIME=180
; This will shut all of your default browser windows. 
; $WINDOWNAME="Application Install - Security Warning"
; WinWaitActive($WINDOWNAME)
; WinClose($WINDOWNAME)

$WINDOWNAME="Application Install - Security Warning"
$CXNAME="RightNow CX"
do
	sleep(50)
until WinExists($WINDOWNAME) or WinExists($CXNAME)

If (WinExists($WINDOWNAME)) Then
	ControlClick($WINDOWNAME,"","[TEXT:&Install]")
	WinSetState($WINDOWNAME,"",@SW_HIDE)

	$WINDOWNAME="(0%) Installing RightNow"
	WinExists($WINDOWNAME)
	WinSetState($WINDOWNAME,"",@SW_HIDE)
	$LONGWAITTIME=300

	WinWait($CXNAME,"",$LONGWAITTIME)
	;Installation complete

	; Wait for 2 seconds before calling the WinKill function.
	Sleep(2000)

	; Kill the window using the handle returned by WinWait.
	WinKill($CXNAME, "")
Else
	Sleep(2000)
	WinKill($CXNAME, "")
EndIf



Exit