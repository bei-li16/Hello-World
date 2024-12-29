# gcc编译选项

## 常用编译选项

1. -o: 指定输出文件名

```python
gcc -o myprogram myprogram.c
```

2. -c: 只编译不链接，生成目标文件（.o）

```python
gcc -c myprogram.c
```

3. -Wall: 打开所有警告信息

```python
gcc -Wall myprogram.c -o myprogram
```

4. -g: 生成调试信息

```python
gcc -g myprogram.c -o myprogram
```

5. -O: 优化代码，-O0表示不优化，-O1, -O2, -O3表示不同级别的优化

```python
gcc -O2 myprogram.c -o myprogram
```

6. -I: 添加头文件搜索路径

```python
gcc -I/path/to/headers myprogram.c -o myprogram
```

7. -L: 添加库文件搜索路径

```python
gcc -L/path/to/libs myprogram.c -lmylib -o myprogram
```

8. -l: 链接指定的库

```python
gcc myprogram.c -lm -o myprogram
```

9. -E 选项：这个选项告诉GCC仅执行预处理步骤，不进行编译、汇编和链接。

```python
gcc -E example.c -o example.i
```

10. -S选项表示生成汇编代码，-o选项指定输出文件名

```makefile
SRCDIR := src
OUTDIR := Debug
AFLAGS := -Wall -g
$(OUTDIR)/%.s: %.c $(DEPS) | $(OUTDIR)
    $(CC) $(AFLAGS) -S $< -o $@ -I$(SRCDIR)/include
```

## 其他常用选项

1. -D: 定义宏

```python
gcc -DDEBUG myprogram.c -o myprogram
```

2. -std=c99: 指定C标准版本

```python
gcc -std=c99 myprogram.c -o myprogram
```

3. -static: 静态链接库，避免动态库依赖问题

```python
gcc -static myprogram.c -o myprogram
```

4. -pthread: 启用POSIX线程库支持

```python
gcc -pthread myprogram.c -o myprogram
```
