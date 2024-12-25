@echo off
@REM 调用 make 命令编译 main.c 文件
setlocal

:: 获取当前路径并存储到变量current_path中
set current_path=%cd%
set TARGET = %current_path%/Debug/main
:: 输出当前路径
echo Current path is: %current_path%

:: 在这里可以添加其他需要使用current_path变量的命令

if "%~1"=="make" (
    echo Make and Build the projection.
    goto Build_Proj
) else if "%~1"=="build" (
    echo Build the projection.
    goto Build_Proj
) else if "%~1"=="clean" (
    echo Clean the projection.
    goto Clean_Proj
) else if "%~1"=="rebuild" (
    echo Rebuild the projection.
    goto Rebuild_Proj
) else (
    echo Unknown parameter: %~1%
    goto Usage
)

@REM Make and build the Project
:Build_Proj
    @REM %TARGET%
    mingw32-make.exe -j12 -C ./ all
    if errorlevel 1 (
        echo.
        echo === Build Failed ===
        echo.
        exit /b 1
    ) else (
        echo.
        echo === Build Succeeded ===
        echo.
        exit /b 0
    )
    goto EndBuild

@REM Clean Project
:Clean_Proj
    mingw32-make.exe clean
    echo.
    echo === Clean End ===
    echo.
    exit /b 0
    goto EndBuild

@REM Clean and build the Project
:Rebuild_Proj
    @REM %TARGET%
    echo === Clean the project... ===
    mingw32-make.exe clean
    echo === Build the project... ===
    mingw32-make.exe -j12 -C ./ all
    if errorlevel 1 (
        echo.
        echo === Build Failed ===
        echo.
        exit /b 1
    ) else (
        echo.
        echo === Build Succeeded ===
        echo.
        exit /b 0
    )
    goto EndBuild

:Usage
    echo Usage: build.bat param1
    echo.
    echo param1:
    echo    make        - make the project.
    echo    build       - build the project.
    echo    rebuild     - rebuild the project.
    echo.
    exit /b 0
    goto EndBuild

:EndBuild
endlocal
pause
