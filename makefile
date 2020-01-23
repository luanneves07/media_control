#Name
PROJECT_NAME=media_control

# All source files
SOURCE=$(wildcard ./src/*.c)

# all header files
HEADERS=$(wildcard ./src/*.h)

# All Object files
OBJECTS=$(subst .c,.o,$(subst source,objects,$(SOURCE)))

# Compiler
CC=gcc

# Compiler flags
CC_FLAGS=$(shell `pkg-config --cflags --libs glib-2.0`) \
 -c \
 -W \
 -Wall \
 -ansi \
 -pedantic 

# Clean command
RM = rm -rf

#
#	Compilation
#
all: objFolder $(PROJECT_NAME)

$(PROJECT_NAME): $(OBJECTS)
	@ echo $(CC_FLAGS)
	@ echo 'Building binary using $(CC) linker: $@'
	$(CC) -o $@ $^
	@ echo 'Finished building binary: $@'
	@ echo ' '

./objects/%.o: ./src/%.c ./src/%.h
	@ echo 'Building target using $(CC) compiler: $<'
	$(CC) $< $(CC_FLAGS) -o $@ 
	@ echo ' '
 
./objects/main.o: ./src/main.c $(HEADERS)
	@ echo 'Building target using GCC compiler: $<'
	$(CC) $< $(CC_FLAGS) -o $@
	@ echo ' '

objFolder:
	@ mkdir -p objects
 
clean:
	@ $(RM) ./objects/*.o $(PROJECT_NAME) *~
	@ $(RM) objects
 
.PHONY: all clean