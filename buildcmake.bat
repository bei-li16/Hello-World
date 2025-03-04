@echo off
setlocal enabledelayedexpansion

REM 配置参数
set BUILD_DIR=build
set EXECUTABLE=HelloWorld.exe
set GENERATOR=MinGW Makefiles
set BUILD_TYPE=Release

REM 设置工具链路径（根据实际安装路径修改）
set "MAKE_DIR=C:\MinGW\bin"
set "CMAKE_DIR=C:\Program Files\CMake\bin"
set PATH=%MAKE_DIR%;%CMAKE_DIR%;%PATH%

REM 清理旧构建
if exist "%BUILD_DIR%" rmdir /s /q "%BUILD_DIR%"

REM 创建构建目录
mkdir "%BUILD_DIR%"
cd "%BUILD_DIR%"

REM 关键修复：指定 CMakeLists.txt 所在目录（此处为上级目录）
cmake .. -G "%GENERATOR%" -DCMAKE_BUILD_TYPE=%BUILD_TYPE%

REM 编译
if "%GENERATOR%" == "MinGW Makefiles" (
    mingw32-make -j12
) else if "%GENERATOR%" == "Visual Studio 17 2022" (
    cmake --build . --config %BUILD_TYPE%
)

REM 运行程序
"%EXECUTABLE%"

REM 返回原目录
cd ..