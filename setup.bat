@echo Setting up
@SET here=%~p0
@echo Moving file "%here%dist\gitdist.exe" to "%here%gitdist"
@move "%here%dist\gitdist.exe" "%here%gitdist"
@echo Moving dir "%here%gitdist" to "%USERPROFILE%\"
@move "%here%gitdist" "%USERPROFILE%\"
@reg add "HKCU\Environment" /v Path /d "%path%;%USERPROFILE%\gitdist;%USERPROFILE%\gitdist\files" /t REG_SZ /f 
@call "%here%\envupdate"
@echo Setup Complete
@rrd /s /q "%here%"
