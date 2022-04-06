NAME:=xavine_graphics_third_party

all: packages
packages: debug release
	rsync --recursive --progress --delete --update build/packages/ ../xavine-repo/packages/

debug:
	xmake f -p linux -a x86_64 -m debug
	xmake package
	rsync --recursive --progress --delete --update include/ build/packages/x/xavine_graphics/linux/x86_64/debug/include/

release:
	xmake f -p linux -a x86_64 -m release
	xmake package
	rsync --recursive --progress --delete --update include/ build/packages/x/xavine_graphics/linux/x86_64/release/include/

clean:
	rm -rf build
