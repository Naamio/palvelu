clean:
	if	[ -d ".build" ]; then \
		rm -rf .build ; \
	fi

build:
	swift build

test:
	swift test

build-release: clean
	docker run -v $$(pwd):/tmp/palvelu -w /tmp/palvelu -it ibmcom/swift-ubuntu:4.0 swift build -c release -Xcc -fblocks -Xlinker -L/usr/local/lib

.PHONY: clean build test
