all: typecheck

typecheck: parser.tab.c lex.yy.c inputt.c
	gcc parser.tab.c lex.yy.c inputt.c -o typecheck -lfl

parser.tab.c parser.tab.h: parser.y
	bison -d parser.y

lex.yy.c: lexer.l parser.tab.h
	flex lexer.l

clean:
	rm -f typecheck lex.yy.c parser.tab.c parser.tab.h
