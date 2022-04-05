NAME:=xavine_graphics_third_party

all: packages
packages: debug release
	rsync --recursive --progress --delete --update build/packages/ ../xavine-repo/packages/

debug:
	xmake f -p linux -a x86_64 -m debug
	xmake package

release:
	xmake f -p linux -a x86_64 -m release
	xmake package

clean:
	rm -rf build
