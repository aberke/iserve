MODULES_DIRECTORY=examples/iserve_system
ERL=erl

.PHONY: all src clean

run_shell: clean all
	erl -pa ebin examples/iserve_system/ebin \
		-eval 'application:start(sasl).' \
		-eval 'application:start(iserve).' \
		-eval 'application:start(iserve_system).'

all: src
	./app.escript `cat LATEST_VERSION` > ebin/iserve.app

src:
	cd src && erl -make all
	cd $(MODULES_DIRECTORY)/src && erl -make all

clean:
	rm -f ebin/*
	rm -f MODULES_DIRECTORY/ebin/*.beam
# 	rm -f test/*.beam test/*.html
# 	$(MAKE) -C test clean

# test.spec: test.spec.in
# 	cat test.spec.in | sed -e "s,@PATH@,$(PWD)," > $(PWD)/test.spec
# cover.spec: cover.spec.in
# 	cat cover.spec.in | sed -e "s,@PATH@,$(PWD)," > $(PWD)/cover.spec

# test: test.spec cover.spec src
# 	mkdir -p etc/log
# 	run_test -pa $PWD/test -spec test.spec -cover cover.spec

# cover: 
# 	@(cd test && erl -make )
# 	@erl -noshell \
#          -eval 'file:set_cwd(test).' \
#          -eval 'cover:compile_beam_directory().' \
#          -eval 'iserve_master_test:test().' \
#          -eval '[cover:analyse_to_file(M, [html]) || M <- cover:modules()].' \
#          -s init stop

