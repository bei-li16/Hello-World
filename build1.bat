@echo off
@REM 调用 make 命令编译 main.c 文件
setlocal

@REM mingw32-make.exe
@REM mingw32-make.exe -j12 -C ./ %TARGET%
mingw32-make.exe clean
@REM mingw32-make.exe all
exit /b 0
endlocal
pause
