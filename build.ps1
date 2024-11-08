# 删除旧的构建目录
Remove-Item -Recurse -Force .\build

# 创建新的构建目录
New-Item -ItemType Directory -Force .\build

# 进入构建目录
cd .\build

# 配置构建
cmake ..

# 构建并安装
cmake --build . --target install
