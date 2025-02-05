@echo off
@rem Environment variables - absolute paths simplifying re-use of the script on another machine
@rem  - Absolute path to SPT workspace (it is recommended to copy/move all user files in this workspace)
SETLOCAL ENABLEDELAYEDEXPANSION
if "%SPT_WORKSPACE%"=="" (
  SET "SPT_WORKSPACE=%~dp0"
  SET "SPT_WORKSPACE=!SPT_WORKSPACE:~0,-1!"
  FOR %%i in ("!SPT_WORKSPACE!") DO (
    SET "SPT_WORKSPACE=%%~dpi"
  )
  SET "SPT_WORKSPACE=!SPT_WORKSPACE:~0,-1!"
)
ENDLOCAL & SET "SPT_WORKSPACE=%SPT_WORKSPACE%"
@rem  - Absolute path to SPT installation directory
if "%SPT_INSTALL_BIN%"=="" (
  SET "SPT_INSTALL_BIN=C:\Users\nxf84544\code\spsdk_rw61x_branch_merge_spsdk_1.9.1\venv"
)

@rem Used command line utilities
SET "nxpdebugmbox=%SPT_INSTALL_BIN%\tools\spsdk\nxpdebugmbox.exe"
pushd "%SPT_WORKSPACE%"
set /A found_error=0
call "%nxpdebugmbox%" -i jlink -p 2.0 auth -b 1  ^
    -c "%SPT_WORKSPACE%\debug_auth\debug_auth_cert.dc"  ^
    -k "%SPT_WORKSPACE%\keys\debug_authentication_key_ECC_256.pem"
if errorlevel 1 (
    set /A found_error=1
)
popd
if %found_error% == 1 (
   echo nxpdebugmbox failed
   exit /B 2
)
echo elftosb succeeded
exit /B %found_error%