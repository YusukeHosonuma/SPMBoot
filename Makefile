init:
	swift package init --type executable

update:
	swift package update

build:
	swift build

release-build:
	swift build --disable-sandbox -c release -Xswiftc -static-stdlib

run:
	.build/debug/spm-boot bar

debug: build run

xcode:
	swift package generate-xcodeproj
