ENTRY_NAME = dev.candar.jni.HelloJNI
TARGET_NAME = libhello.so

# Compiler and flags
CFLAGS ?= -Wall -Wextra -I/usr/lib/jvm/java/include -I/usr/lib/jvm/java/include/linux -fPIC
LDFLAGS ?= -shared

# Directories
SRC_DIR = src

C_DIR= $(SRC_DIR)/c
JAVA_DIR= $(SRC_DIR)/java
INCLUDE_DIR = $(SRC_DIR)/include

CLS_DIR = cls
OBJ_DIR = obj
BIN_DIR = bin

# Files
SRCS := $(wildcard $(C_DIR)/*.c)
OBJS := $(patsubst $(C_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRCS))
DEPS = $(wildcard $(INCLUDE_DIR)/*.h)
#JAVAS := $(wildcard $(JAVA_DIR)/*.java)
JAVAS := $(shell find $(JAVA_DIR) -name '*.java')
CLASSES := $(patsubst $(JAVA_DIR)/%.java,$(CLS_DIR)/%.class,$(JAVAS))

# Executable name
EXEC = $(BIN_DIR)/$(TARGET_NAME)

# Default target
all: $(CLS_DIR) $(EXEC)

# Rule for compiling classes
$(CLS_DIR): $(JAVAS)
	@mkdir -p $@
	javac -h $(INCLUDE_DIR) -d $(CLS_DIR) $^
	@touch $@

# Rule for creating object files
$(OBJ_DIR)/%.o: $(C_DIR)/%.c $(DEPS)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

# Rule for creating the executable
$(EXEC): $(OBJS)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@

# Clean target
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR) $(CLS_DIR)

run: all
	java -Djava.library.path=$(BIN_DIR) -cp $(CLS_DIR) $(ENTRY_NAME)

# Phony targets
.PHONY: all clean run
.SUFFIXES:
