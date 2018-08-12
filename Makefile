.PHONY: all tests clean doc build examples install

build:
	dune build

all:	build examples tests doc


examples:
	dune build @examples/examples
	ln -fs _build/default/examples/*.exe .

tests:
	dune build @test/tests
	ln -fs _build/default/test/*.exe .

clean:
	find -L . -name "*~" -delete
	dune clean
	rm -f *.exe
	rm -rf docs/*


doc:	build
	rm -rf docs/*
	ocamlfind ocamldoc -html -d docs _build/default/src/cryptodbm.mli
	cp style/style.css docs/

## odoc works, but the html structure is better with ocamldoc, hence it is easier to style.

#doc:	build
#	dune build @doc
#	rm -rf docs/*
#	cp -R _build/default/_doc/_html/* docs/
#	cp style/style.css docs/odoc.css

