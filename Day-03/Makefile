all: test build

build:
	perl script.pl input.txt
	perl script-part-2.pl input.txt

test:
	perl script.pl test.txt | grep 157
	perl script-part-2.pl test.txt | grep 70
