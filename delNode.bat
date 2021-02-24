@echo off
setlocal
setlocal enabledelayedexpansion

	SET "isFolderExist=FALSE"

	ECHO 'Below are the list for folder to be deleted'
	ECHO '-------------------------------------------'
	CALL :Find_Files SHOW
	ECHO '-------------------------------------------'
	
	if "%isFolderExist%"=="FALSE" (
		CLS
		ECHO Did not found any folder named "node_modules" in directory "%CD%"
		PAUSE
		EXIT
	)
		
	set /p id=Do you wish do delete above folder (Y/N):
	if /i "%id%"=="y" (
		CLS
		CALL :Find_Files DELL
		ECHO '-------------------------------------------'
		ECHO '.......FILES WERE DELETED..................'
	) else (
		ECHO 'DELETING WAS SKIPPED'
	)
	pause
	exit

	::Defing Function
	:Find_Files

	set parval=%~1
	for /d /r "%CD%" %%i in (node_modules) do (
	  @if exist "%%i" (
		set "isFolderExist=TRUE"
		@set _variable=%%i
		IF "%parval%"=="SHOW" (
			@echo !_variable!
		) ELSE (
			@echo DELETIN...... !_variable!
			RD /S /Q "!_variable!"
		)
	  )
	)

endlocal