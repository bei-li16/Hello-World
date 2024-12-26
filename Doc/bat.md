# bat语法

## 常用命令

- setlocal——开始局部全局变量
- endlocal——结束局部全局变量
- pause——暂停
- exit /b 0——退出脚本，返回0
- set PATH = %VAR%;%PATH%——为全局变量添加VAR

## 注意事项

- bat删除命令为del例如`del /Q $(DEL_OUT_FILES)`, 路径必须时\, /Q表示静默;
- linux删除命令是`rm -f */o`;
