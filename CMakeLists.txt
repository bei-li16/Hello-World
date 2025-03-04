cmake_minimum_required(VERSION 3.15)
project(HelloWorld LANGUAGES C CXX)

#-----------------------------------------------------------------------
# 自动扫描 BSP 下所有模块的源码和头文件
#-----------------------------------------------------------------------
# 定义 BSP 根目录
set(BSP_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

# 递归查找所有 BSP 模块的 src 目录
file(GLOB_RECURSE BSP_SRC_FILES 
    "${BSP_ROOT}/src/*.c"          # 匹配 LED/src/*.c, UART/src/*.c 等
    "${BSP_ROOT}/src/*.cpp"        # 可选：支持 C++
)

# 递归查找所有 BSP 模块的 include 目录
file(GLOB_RECURSE BSP_INCLUDE_DIRS 
    "${BSP_ROOT}/inc"              # 匹配 LED/inc, UART/inc 等
)

#-----------------------------------------------------------------------
# 主程序配置
#-----------------------------------------------------------------------
# 主程序源码（Core/src/main.c）
file(GLOB_RECURSE CORE_SRC_FILES 
    "${CMAKE_CURRENT_SOURCE_DIR}/main.c"
)

# 添加可执行文件
add_executable(${PROJECT_NAME} 
    ${CORE_SRC_FILES}
    ${BSP_SRC_FILES}
)

# 包含所有头文件目录
target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/inc
    ${BSP_INCLUDE_DIRS}
)

#-----------------------------------------------------------------------
# 可选：为每个 BSP 模块生成静态库（更模块化）
#-----------------------------------------------------------------------
# 遍历 BSP 下所有模块目录
# file(GLOB BSP_MODULES RELATIVE ${BSP_ROOT} "${BSP_ROOT}/*")

# foreach(MODULE ${BSP_MODULES})
#     # 检查是否为有效模块（包含 src 和 inc 目录）
#     if(IS_DIRECTORY ${BSP_ROOT}/${MODULE}/src AND IS_DIRECTORY ${BSP_ROOT}/${MODULE}/inc)
#         # 收集模块源码
#         file(GLOB MODULE_SRC_FILES 
#             "${BSP_ROOT}/${MODULE}/src/*.c"
#         )
        
#         # 生成静态库
#         add_library(${MODULE} STATIC ${MODULE_SRC_FILES})
        
#         # 包含模块头文件
#         target_include_directories(${MODULE} PUBLIC
#             ${BSP_ROOT}/${MODULE}/inc
#         )
        
#         # 链接到主程序
#         target_link_libraries(${PROJECT_NAME} PRIVATE ${MODULE})
#     endif()
# endforeach()