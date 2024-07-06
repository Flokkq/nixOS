CC = gcc
CFLAGS = -Wall -Wextra -Iinclude

SRCDIR = src
OBJDIR = obj
BINDIR = bin
TESTDIR = src/tests

SOURCES = $(wildcard $(SRCDIR)/*.c)
OBJECTS = $(SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
EXECUTABLE = $(BINDIR)/http_server

TEST_SOURCES = $(wildcard $(TESTDIR)/*.c)
TEST_OBJECTS = $(TEST_SOURCES:$(TESTDIR)/%.c=$(OBJDIR)/%.o)
# Filter out main.o from OBJECTS for the test build
TEST_OBJECTS += $(filter-out $(OBJDIR)/main.o, $(OBJECTS))
TEST_EXECUTABLE = $(BINDIR)/test_server

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	mkdir -p $(BINDIR)
	$(CC) $(CFLAGS) $(OBJECTS) -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR)/%.o: $(TESTDIR)/%.c
	mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

test: $(TEST_EXECUTABLE)
	$(TEST_EXECUTABLE)

$(TEST_EXECUTABLE): $(TEST_OBJECTS)
	mkdir -p $(BINDIR)
	$(CC) $(CFLAGS) $(TEST_OBJECTS) -o $@

run: $(EXECUTABLE)
	./$(EXECUTABLE)

clean:
	rm -rf $(OBJDIR) $(BINDIR)

.PHONY: all clean test run
