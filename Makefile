TEST?=./...

default: test

package:
	@sh -c "$(CURDIR)/scripts/package.sh"

bin:
	@sh -c "$(CURDIR)/scripts/build.sh"

clean:
	@sh -c "$(CURDIR)/scripts/clean.sh"

dev:
	@TF_DEV=1 sh -c "$(CURDIR)/scripts/dev.sh"

test:
	"$(CURDIR)/scripts/test.sh"

release:
	"$(CURDIR)/scripts/release.sh"

pact:
	"$(CURDIR)/scripts/pact.sh"

testrace:
	go test -race $(TEST) $(TESTARGS)

updatedeps:
	go get -d -v -p 2 ./...

.PHONY: bin default dev test pact updatedeps clean release
