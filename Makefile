PROJECT	= toy-robot-ruby

.PHONY: build, run, test, shell

build:
	docker build --rm -t $(PROJECT) .

run:
	docker run --rm -it $(PROJECT)

test:
	docker run --rm -t $(PROJECT) rspec spec

shell:
	docker run --rm -it \
	  -v $(PWD):/$(PROJECT) \
	  $(PROJECT) bash
