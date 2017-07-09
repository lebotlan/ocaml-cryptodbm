.PHONY: all test clean doc build examples

all:	build

build:
	jbuilder build

examples:
	jbuilder build @examples/examples

clean:
	find -L . -name "*~" -delete
	jbuilder clean


