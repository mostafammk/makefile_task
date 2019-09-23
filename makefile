vpath %.c ./Src
vpath %.h ./Inc

CC = gcc
SRC_PATH = ./Src
LINK_TARGET = app.exe
INCLUDE_PATH = ./Inc
DEP_Path = ./dep


CLEAN_TARGET = $(LINK_TARGET) $(OBJ)

SRC_Files = $(subst $(SRC_PATH)/,,$(wildcard $(SRC_PATH)/*.c)) 
OBJ = $(patsubst %.c,%.o, $(SRC_Files))



all:$(LINK_TARGET)
	echo Bulding done !
clean:
	-rm $(CLEAN_TARGET)
	echo Cleaning done ! 
	
$(LINK_TARGET): $(OBJ) quiz.o
	$(CC) $(OBJ) quiz.o -o $@
	echo Linking done !



%.o:%.c
	$(CC) -c -I$(INCLUDE_PATH) $< -o $@
	$(CC) -MM -I$(INCLUDE_PATH) $< > $(DEP_Path)\$*.d
	mv *.d $(DEP_Path)
		