DESTDIR?=dist/
VARIANT?=debug

build:
	# building ${VARIANT}...
	bjam build ${VARIANT} --user-config=./build-config.jam

clean:
	# clean...
	bjam --clean --user-config=./build-config.jam

install:
	# install...
	bjam install ${VARIANT} --user-config=./build-config.jam --prefix=${DESTDIR}

distclean: clean

update-tools:
	# updating tools...
	@git remote add build-tools http://github.com/rout/boost-build-tools.git 2>/dev/null |:
	@git fetch build-tools master:build-tools 2>/dev/null
	@git checkout build-tools `git ls-tree --name-only build-tools *`
	@git branch -D build-tools 2>/dev/null 1>/dev/null
	@git remote rm build-tools
