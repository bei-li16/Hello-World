# Makefile语法

- addsuffix 函数——添加后缀

    - 在 Makefile 中, addsuffix 是一个内置函数，用于给字符串列表中的每个元素添加一个指定的后缀。其语法如下：
 
 ```make
    - $(addsuffix <suffix>, <list>)
    - <suffix>：要添加的后缀。
    - <list>：字符串列表。
    FILES := file1 file2 file3
    SUFFIXED_FILES := $(addsuffix .txt, $(FILES)
    上述代码会将 FILES 列表中的每个元素都加上 .txt 后缀
    FILES := file1 file2 file3
    SUFFIXED_FILES := $(addsuffix .txt, $(FILES))
    SUFFIXED_FILES := file1.txt file2.txt file3.txt
```

- patsubst 函数

```make
    $(patsubst pattern,replacement,text)
    OUT_FILES = $(patsubst %.c, $(OUTDIR)/%.o, ${SRC_FILES})
```

&emsp;&emsp;- pattern：一个模式字符串，可以包含通配符%，它代表任意长度的字符串。<br>
&emsp;&emsp;- replacement：替换字符串，可以包含%，它会被pattern中匹配到的字符串替换。<br>
&emsp;&emsp;- text：要处理的文本，通常是文件名列表或者变量。<br>

- notdir 函数——去除文件路径

    `$(notdir $(SRCS))`这行代码函数从每个源文件路径中提取文件名部分，去掉目录部分。例如，如果 SRCS 包含 src/main.c 和 module1/file1.c，那么 $(notdir $(SRCS)) 将生成 main.c file1.c。

- wildcard 函数——查找文件

&emsp;&emsp;查找所有.c文件并赋值给SRCS:`SRCS := $(wildcard $(addsuffix /*.c, $(SRCPATH)))`

- subst 函数——替换/为\

&emsp;&emsp;`DEL_OUT_FILES = $(subst /,\,$(OUT_FILES))`

- addprefix 函数——添加前缀

```make
CFLAGS = -Wall 						\
         -g 						\
		 $(addprefix -I, $(INCPATH))\
```

- foreach 函数——添加前缀
    
    定义：`$(foreach <var>,<list>,<text>)`
    参数解释：[var]是一个临时的局部变量，用于在循环过程中存储当前元素的值；[list]是一个空格分隔的列表，表示要迭代的元素集合；[text]是包含表达式的文本，其中可以使用[var]来引用当前元素的值。
    - 工作原理
        迭代过程：foreach函数会逐一取出[list]中的每个元素，将其赋值给[var]，然后执行[text]中的表达式。每次执行都会返回一个字符串，这些字符串最终以空格分隔的形式组成foreach函数的返回值。
    - 使用场景
        文件名转换：例如，将一组源文件名（如.c文件）转换为目标文件名（如.o文件）。
        目录遍历：遍历一组目录，并对每个目录执行特定操作，如编译、链接等。
        条件判断：结合条件语句（如ifeq），根据不同条件执行不同操作

        ```make
        SRC_FILES = $(foreach DIR,$(SRCPATH),$(notdir $(wildcard $(DIR)/*.c)))
        ```

## 变量

- $@  表示目标文件
- $^  表示所有的依赖文件
- $<  表示第一个依赖文件
- $?  表示比目标还要新的依赖文件列表
- $% 仅当目标是函数库文件中，表示规则中的目标成员名。例如，如果一个目标是“foo.a(bar.o)”，那么，“$%”就是“bar.o”，“$@”就是“foo.a”。如果目标不是函数库文件（Unix下是[.a]，Windows下是[.lib]），那么，其值为空。
- $+ 这个变量很像“$^”，也是所有依赖目标的集合。只是它不去除重复的依赖目标。
- $* 这个变量表示目标模式中“%”及其之前的部分。如果目标是“dir/a.foo.b”，并且目标的模式是“a.%.b”，那么，“$*”的值就是“dir/a.foo”。这个变量对于构造有关联的文件名是比较有较。如果目标中没有模式的定义，那么“$*”也就不能被推导出，但是，如果目标文件的后缀是make所识别的，那么“$*”就是除了后缀的那一部分。例如：如果目标是“foo.c”，因为“.c”是make所能识别的后缀名，所以，“$*”的值就是“foo”。这个特性是GNU make的，很有可能不兼容于其它版本的make，所以，你应该尽量避免使用“$*”，除非是在隐含规则或是静态模式中。如果目标中的后缀是make所不能识别的，那么“$*”就是空值。
