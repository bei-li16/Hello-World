@echo off
@REM 通过使用 setlocal enabledelayedexpansion，你可以启用延迟变量扩展；
@REM 使得变量在每次使用时才进行解析。要使用延迟扩展的变量；
@REM 你需要使用 !variable! 语法，而不是 %variable%.
setlocal enabledelayedexpansion

@REM 获取当前目录
set "currentDir=%cd%"

REM 定义一个函数用于递归删除文件

for /R "%currentDir%" %%F in (*.exe, *.o) do (
    echo Deleting file: %%F
    del "%%F"
)

echo All .exe and .o files have been deleted.
exit /b 0
pause
