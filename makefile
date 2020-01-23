# REV_002

#Name
PROJECT_NAME=media

# All source files
SOURCE=$(wildcard *.c)

# all header files
HEADERS=$(wildcard *.h)

# All Object files
OBJECTS=$(SOURCE:.c=.o)

# Compiler
CC=gcc

# Compiler flags
CC_FLAGS=	-c \
					-W \
					-Wall \
					-ansi \
					-pedantic

#
#	Compilation
#
all: $(PROJECT_NAME)

$(PROJECT_NAME): $(OBJECTS)
	$(CC) -o $@ $^

%.o: %.c %.h
 
 $(CC) -o $@ $< $(CC_FLAGS)
 
main.o: main.c $(HEADERS)
 $(CC) -o $@ $< $(CC_FLAGS)
 
clean:
 rm -rf *.o $(PROJECT_NAME) *~