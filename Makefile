clean:
	if	[ -d ".build" ]; then \
		rm -rf .build ; \
	fi

build: clean
	@echo --- Building
	swift build

test: build
	swift test

run: build
	@echo --- Invoking executable
	./.build/debug/Kauppa

build-release: clean
	docker run -v $$(pwd):/tmp/palvelu -w /tmp/palvelu -it ibmcom/swift-ubuntu:4.0 swift build -c release -Xcc -fblocks -Xlinker -L/usr/local/lib

.PHONY: clean build test run
