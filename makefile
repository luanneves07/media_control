#Name
PROJECT_NAME=media

# All source files
SOURCE=$(wildcard ./source/*.c)

# all header files
HEADERS=$(wildcard ./source/*.h)

# All Object files
OBJ=$(subst .c,.o,$(subst source,objects,$(C_SOURCE)))

# Compiler
CC=gcc

# Compiler flags
CC_FLAGS=	-c \
					-W \
					-Wall \
					-ansi \
					-pedantic

# Clean command
RM = rm -rf

#
#	Compilation
#
all: objFolder $(PROJ_NAME)

$(PROJECT_NAME): $(OBJECTS)
	@ echo 'Building binary using $(CC) linker: $@'
	$(CC) -o $@ $^
	@ echo 'Finished building binary: $@'
	@ echo ' '

./objects/%.o: ./source/%.c ./source/%.h
	@ echo 'Building target using $(CC) compiler: $<'
	$(CC) $< $(CC_FLAGS) -o $@
	@ echo ' '
 
./objects/main.o: ./source/main.c $(H_SOURCE)
	@ echo 'Building target using GCC compiler: $<'
	$(CC) $< $(CC_FLAGS) -o $@
	@ echo ' '

objFolder:
	@ mkdir -p objects
 
clean:
	@ $(RM) ./objects/*.o $(PROJ_NAME) *~
	@ rmdir objects
 
.PHONY: all clean