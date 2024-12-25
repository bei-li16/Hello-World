# Hello-World
## Create github projection
- echo "# Hello-World" >> README.md         ; Create README.md file.
- git init                                  ; init the project.
- git add README.md                         ; add file README.md.
- git commit -m "first commit"              ; commit changes to local repository
- git branch -M master                      ; rename the branch master to <new-branchname>
- git remote add origin https://github.com/bei-li16/Hello-World.git     ; connect to URL https://github.com/bei-li16/Hello-World.git
- git push -u origin master                 ; push to origin, -u is short of --set-upstream 它设置了上游分支，使得本地分支与远程分支保持同步

## Markdown 语法
- #一级标题，##二级标题以此类推
- 在无序列表（用-、*或+）或有序列表（用数字加点号）中，每个项目会自动换行
- Markdown预览：>Markdown: Open Preview to the Side

## Makefile语法
- addsuffix 函数
 1. 在 Makefile 中，addsuffix 是一个内置函数，用于给字符串列表中的每个元素添加一个指定的后缀。其语法如下：
    - $(addsuffix <suffix>, <list>)
    - <suffix>：要添加的后缀。
    - <list>：字符串列表。
    FILES := file1 file2 file3
    SUFFIXED_FILES := $(addsuffix .txt, $(FILES))
    上述代码会将 FILES 列表中的每个元素都加上 .txt 后缀
    FILES := file1 file2 file3
    SUFFIXED_FILES := $(addsuffix .txt, $(FILES))
    SUFFIXED_FILES := file1.txt file2.txt file3.txt


    OBJS := $(patsubst %.c, $(OUTDIR)/%.o, $(notdir $(SRCS))) 这行代码在 Makefile 中用于生成目标文件（即 .o 文件）的路径列表，并将这些路径存储在变量 OBJS 中。让我们逐步解析这行代码的含义：

$(SRCS):

SRCS 是一个包含所有源文件路径的变量。它通过 wildcard 和 addsuffix 函数自动查找并列出所有源文件。例如，如果 SRCPATHS 包含 src 和 module1，那么 SRCS 可能包含 src/main.c 和 module1/file1.c。
$(notdir $(SRCS)):

notdir 函数从每个源文件路径中提取文件名部分，去掉目录部分。例如，如果 SRCS 包含 src/main.c 和 module1/file1.c，那么 $(notdir $(SRCS)) 将生成 main.c file1.c。
$(patsubst %.c, $(OUTDIR)/%.o, ...):

patsubst 是一个模式替换函数，用于将匹配的模式替换为指定的字符串。在这里，它将每个 .c 文件名替换为对应的 .o 文件路径，并放在 $(OUTDIR) 目录下。
%.c 是模式，表示所有以 .c 结尾的文件。
$(OUTDIR)/%.o 是替换字符串，表示将 .c 文件替换为 $(OUTDIR) 目录下的 .o 文件。
组合起来:

假设 SRCS 包含 src/main.c module1/file1.c，那么 $(notdir $(SRCS)) 将生成 main.c file1.c。
然后 $(patsubst %.c, $(OUTDIR)/%.o, main.c file1.c) 将生成 Debug/main.o Debug/file1.o。
因此，这行代码的作用是：

从 SRCS 中提取出所有源文件的文件名部分。
将这些文件名转换为相应的目标文件路径，并放在 $(OUTDIR) 目录下。
最终结果存储在 OBJS 变量中。



