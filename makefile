# Makefile

# 编译器
CC = gcc

# 获取当前文件夹路径
CURRENT_PATH := $(CURDIR)

# 源文件路径
SRCPATH = $(CURRENT_PATH)			\
	      $(CURRENT_PATH)/src		\

# 头文件路径
INCPATH = $(CURRENT_PATH)/inc	    \

# 输出文件路径 TODO: 结尾不要有空格
OUTDIR = $(CURRENT_PATH)/Debug

# 目标文件及路径
TARGET = $(CURRENT_PATH)/Debug/main

# 编译选项——添加编译依赖头文件夹-Iinc
CFLAGS = -Wall 						\
         -g 						\
		 $(addprefix -I, $(INCPATH))\

# 预处理选项——添加编译依赖头文件夹-Iinc
EFLAGS = -Wall 						\
         -g 						\
		 $(addprefix -I, $(INCPATH))\

# 汇编选项——添加编译依赖头文件夹-Iinc
AFLAGS = -Wall 						\
		 -g 						\
		 $(addprefix -I, $(INCPATH))\

# 
vpath %.c $(addsuffix :, $(SRCPATH))
vpath %.h $(addsuffix :, $(INCPATH))

# 自动查找所有源文件和头文件
SRCS := $(wildcard $(addsuffix /*.c, $(SRCPATH)))

SRC_FILES = $(foreach DIR,$(SRCPATH),$(notdir $(wildcard $(DIR)/*.c)))
OUT_FILES = $(patsubst %.c, $(OUTDIR)/%.o, ${SRC_FILES})
EXP_FILES = $(patsubst %.c, $(OUTDIR)/%.i, ${SRC_FILES})
ASM_FILES = $(patsubst %.c, $(OUTDIR)/%.s, ${SRC_FILES})


DEPS := $(wildcard $(addsuffix /*.h, $(INCPATH)))

DEL_OUT_FILES = $(subst /,\,$(OUT_FILES))
EXP_OUT_FILES = $(subst /,\,$(EXP_FILES))
ASM_OUT_FILES = $(subst /,\,$(ASM_FILES))
DEL_TARGET_FILES = $(subst /,\,$(TARGET))

# 打印变量 SRCS 和 DEPS
# $(info SRCS: $(SRCS))
# $(info DEPS: $(DEPS))
# $(info SRC_FILES: $(SRC_FILES))
# $(info OUT_FILES: $(OUT_FILES))
# $(info DEL_OUT_FILES: $(DEL_OUT_FILES))

# 生成可执行文件
$(TARGET): $(OUT_FILES)
	$(CC) $(CFLAGS) -o $@ $^

# 编译每个源文件为对象文件
$(OUTDIR)/%.o: %.c $(DEPS) | $(OUTDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# 预处理每个.c文件为.i文件
$(OUTDIR)/%.i: %.c $(DEPS) | $(OUTDIR)
	$(CC) $(EFLAGS) -E $< -o $@

# 预处理每个.c文件为.s文件
$(OUTDIR)/%.s: %.c $(DEPS) | $(OUTDIR)
	$(CC) -S $(AFLAGS) $< -o $@

# 创建输出目录规则
$(OUTDIR):
	mkdir -p $(OUTDIR)


.PHONY: clean all build
# 清理生成的文件
clean:
	del /Q $(DEL_OUT_FILES)
	del /Q $(EXP_OUT_FILES)
	del /Q $(ASM_OUT_FILES)
	del /Q $(DEL_TARGET_FILES).exe
	@echo Project cleaned.
# 生成TARGET文件
all: $(TARGET) $(EXP_FILES) $(ASM_FILES)
	@echo Build all...

build: $(TARGET)
	@echo Build the target...

