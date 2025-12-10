# Makefile for sorting project with organized structure

CC = gcc
CFLAGS = -Wall -O2 -Iinclude
SRCDIR = src
OBJDIR = obj
DATADIR = data
TARGET = benchmark

# Source files
SRCS = $(SRCDIR)/main.c $(SRCDIR)/sorts.c $(SRCDIR)/utils.c

# Object files (in obj directory)
OBJS = $(OBJDIR)/main.o $(OBJDIR)/sorts.o $(OBJDIR)/utils.o

# Create obj directory if it doesn't exist and build program
all: $(OBJDIR) $(TARGET)

# Create obj directory
$(OBJDIR):
	mkdir -p $(OBJDIR)

# Build the main program
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

# Compile main.c
$(OBJDIR)/main.o: $(SRCDIR)/main.c include/sorts.h include/utils.h
	$(CC) $(CFLAGS) -c $(SRCDIR)/main.c -o $(OBJDIR)/main.o

# Compile sorts.c
$(OBJDIR)/sorts.o: $(SRCDIR)/sorts.c include/sorts.h
	$(CC) $(CFLAGS) -c $(SRCDIR)/sorts.c -o $(OBJDIR)/sorts.o

# Compile utils.c
$(OBJDIR)/utils.o: $(SRCDIR)/utils.c include/utils.h include/sorts.h
	$(CC) $(CFLAGS) -c $(SRCDIR)/utils.c -o $(OBJDIR)/utils.o

# Clean up compiled files
clean:
	rm -rf $(OBJDIR) $(TARGET) $(DATADIR)/*.csv

# Run the program
run: $(TARGET)
	./$(TARGET)

# Phony targets
.PHONY: all clean run