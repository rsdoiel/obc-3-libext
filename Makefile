
BRANCH = $(shell git branch | grep '* ' | cut -d\  -f 2)

OS = $(shell uname)

TEST_PROG = argstest envtest converttest

SHARED_LIBS = extConvert.so

MSG = Quick Save
ifneq ($(msg),)
MSG = $(msg)
endif

build: $(SHARED_LIBS) $(TEST_PROG) test

extConvert.so: extConvert.m extConvert.c
	obc -07 -c extConvert.m
	gcc -fPIC -shared extConvert.c -o extConvert.so

argstest: extArgs.m ArgsTest.m
	obc -07 -o argstest extArgs.m Tests.m ArgsTest.m

envtest: extEnv.m EnvTest.m
	obc -07 -o envtest extEnv.m Tests.m EnvTest.m

converttest: extConvert.m ConvertTest.m extConvert.so
	obc -07 -o converttest extConvert.m Tests.m ConvertTest.m

test: $(TEST_PROG)
	./argstest one two three
	env GOOD_NIGHT=Irine ./envtest
	./converttest

clean: .FORCE
	@for FNAME in $(shell ls -1 *.bak); do rm $$FNAME; done
	@for FNAME in $(shell ls -1 *.k); do rm $$FNAME; done
	@for FNAME in $(shell ls -1 *.so); do rm $$FNAME; done
	@for FNAME in $(TEST_PROG); do if [ -f $$FNAME ]; then rm $$FNAME; fi; done

full_test: clean test

save:
	git commit -am "$(MSG)"
	git push origin $(BRANCH)

status:
	git status

website: README.md page.tmpl
	./mk_website.py

publish: 
	./mk_website.py
	./publish.bash


.FORCE:
