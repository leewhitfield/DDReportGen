:: Forensic_Reports.bat
:: Runs RegRipper2.8 & TZWorks
:: Find and Replace the below lines
::
::
::[FULL_EXPORT_PATH]
::
::
::

@ECHO OFF
ECHO **************    Welcome to your Forensics Report Script      **************
: again
	set /p answer=Did you run this with administrator privilege (Y/N)? 
	if /i "%answer:~,1%" EQU "N" exit
: again

: title
	set /p answer=Did you replace the file path for the script? (Y/N)? 
	if /i "%answer:~,1%" EQU "N" exit
: title


ECHO --------------------------------
ECHO NO TURNING BACK NOW HAHAHAHAHAHAH WTF!!!!
ECHO --------------------------------
PAUSE 


::RegRipper2 
ECHO ****************************REG RIPPER 2.8 REPORTS****************************
cd C:\Tools\RegRipper2.8
rip -r [FULL_EXPORT_PATH]\system_files\SYSTEM -f system > [FULL_EXPORT_PATH]\rr_reports\rr_system.txt
rip -r [FULL_EXPORT_PATH]\system_files\SOFTWARE -f software > [FULL_EXPORT_PATH]\rr_reports\rr_software.txt
rip -r [FULL_EXPORT_PATH]\system_files\SAM -f sam > [FULL_EXPORT_PATH]\rr_reports\rr_sam.txt
rip -r [FULL_EXPORT_PATH]\system_files\ntuser.dat -f ntuser > [FULL_EXPORT_PATH]\rr_reports\rr_ntuser.txt
rip -r [FULL_EXPORT_PATH]\system_files\usrclass.dat -f usrclass > [FULL_EXPORT_PATH]\rr_reports\rr_usrclass.txt
rip -r [FULL_EXPORT_PATH]\system_files\SECURITY -f security > [FULL_EXPORT_PATH]\rr_reports\rr_security.txt

::TZworks 
ECHO *******************************TZWORKS REPORTS********************************
cd [FULL_EXPORT_PATH]\system_files
Y:
C:\Tools\TZWorks\bin\usp64.exe -sys SYSTEM -user ntuser.dat -sw SOFTWARE -setupapi setupapi.dev.log -csv > [FULL_EXPORT_PATH]\tz_works_reports\USB_Report.txt
C:\Tools\TZWorks\bin\sbag64.exe ntuser.dat -csv > [FULL_EXPORT_PATH]\tz_works_reports\NTUSER_ShellBags_Report.txt
C:\Tools\TZWorks\bin\sbag64.exe usrclass.dat -csv > [FULL_EXPORT_PATH]\tz_works_reports\USRCLASS_ShellBags_Report.txt
C:\Tools\TZWorks\bin\jp64.exe -file $J -mftfile $MFT -pulltimes -timeformat hh:mm:ss -csv > [FULL_EXPORT_PATH]\tz_works_reports\Journal_Parser_Report.txt
cd [FULL_EXPORT_PATH]\link_files
dir *.lnk /b /s | C:\Tools\TZWorks\bin\lp64.exe -pipe -csv > [FULL_EXPORT_PATH]\tz_works_reports\Link_Parser_Report.txt
cd [FULL_EXPORT_PATH]\jump_lists
dir *ions-ms /b /s | C:\Tools\TZWorks\bin\jmp64.exe -pipe -csv > [FULL_EXPORT_PATH]\tz_works_reports\JumpList_Report.txt
cd [FULL_EXPORT_PATH]\prefetch
dir *.pf /b /s | C:\Tools\TZWorks\bin\pf64.exe -pipe -csv > [FULL_EXPORT_PATH]\tz_works_reports\Prefetch_Report.txt



ECHO ****************This is the end of the Forensics Reports**********************
ECHO --------------------------------
ECHO To Forensicate and Beyond!!!!!!
ECHO --------------------------------
PAUSE