# REV_001

all: media

media: media.o

media.o: ../src/media_control.c
	gcc -o media.o ../src/media_control.c -c -W -Wall -ansi `pkg-config --cflags --libs glib-2.0`

clean:
	rm -rf *.o *~ media
