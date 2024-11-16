cmake_minimum_required(VERSION 3.29)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(DCMAKE_MAKE_PROGRAM ninja)
set(CMAKE_TOOLCHAIN_FILE "$ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake")
set(pybind11_DIR "$ENV{VCPKG_ROOT}/installed/x64-windows/share/pybind11")
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_SHELL "powershell.exe")
set(PYBIND11_FINDPYTHON ON)
project(pybind11_vcpkg LANGUAGES CXX)

# 找到 Python3 解释器及开发库
find_package(Python3 REQUIRED COMPONENTS Interpreter Development)
find_package(pybind11 CONFIG REQUIRED)

# 创建 pybind11 模块
pybind11_add_module(my_module main.cpp)  # 使用的模块名应该是 "my_module"

# 获取 Python site-packages 路径
set(PYTHON_SITE_PACKAGES_PATH ${Python3_SITEARCH})

# 安装模块到 Python 的 site-packages 目录
install(TARGETS my_module
        LIBRARY DESTINATION ${PYTHON_SITE_PACKAGES_PATH}
        RUNTIME DESTINATION ${PYTHON_SITE_PACKAGES_PATH})
