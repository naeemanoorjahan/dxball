CC  = gcc
SRC = dxball_game.c

UNAME_S := $(shell uname -s 2>/dev/null)

ifeq ($(OS),Windows_NT)
    OUT  = dxball.exe
    LIBS = -lraylib -lopengl32 -lgdi32 -lwinmm
else ifeq ($(UNAME_S),Darwin)
    OUT  = dxball
    LIBS = -lraylib -lm -ldl -lpthread -framework OpenGL -framework Cocoa -framework IOKit
else
    OUT  = dxball
    LIBS = -lraylib -lm -ldl -lpthread -lGL -lrt -lX11
endif

all:
	$(CC) $(SRC) -o $(OUT) $(LIBS)

clean:
	rm -f dxball dxball.exe highscores.txt
