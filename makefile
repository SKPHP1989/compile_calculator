OUT         = calc
CC          = gcc
SCANNER     = calc.l
PARSER      = calc.y
OBJ         = y.tab.o lex.yy.o
OUTFILES    = lex.yy.c y.tab.c y.tab.h y.output $(OUT)

build: $(OUT)

clean:
	rm -f *.o $(OUTFILES)

lex.yy.c: $(SCANNER) y.tab.c
	flex $<

y.tab.c: $(PARSER)
	bison -vdty $<

y.tab.o: y.tab.c
	$(CC) -c $<

lex.yy.o: lex.yy.c
	$(CC) -c $<

$(OUT): $(OBJ)
	$(CC) -o $(OUT) $(OBJ) -lfl