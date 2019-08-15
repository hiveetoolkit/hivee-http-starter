setup:
	@script/setup
.PHONY: setup

build:
	@script/build $(env)
.PHONY: build

build-all:
	@script/build
.PHONY: build-all

start:
	@docker-compose rm -f -s $(env) && docker-compose up --no-recreate --detach $(env)
.PHONY: start

start-all:
	@docker-compose up --detach
.PHONY: start-all

scale:
	@docker-compose rm -f -s $(env) && docker-compose up --no-recreate --detach --scale $(env)=$(replicas)
.PHONY: scale

stop:
	@docker-compose stop $(env)
.PHONY: stop

stop-all:
	@docker-compose stop
.PHONY: stop-all

logs:
	@docker-compose logs --follow $(env)
.PHONY: logs

ps:
	@docker-compose ps
.PHONY: ps

i18n:
	@docker-compose run --entrypoint script/i18n --rm dev $(mode) $(locale)
.PHONY: i18n

lint:
	@docker-compose run --rm dev script/lint
.PHONY: lint

coverage:
	@docker-compose run -e MIX_ENV=test --rm dev script/coverage
.PHONY: lint

test:
	@docker-compose run -e MIX_ENV=test --rm dev script/test
.PHONY: test

console:
	@docker-compose exec --index=$(id) $(env) /bin/bash
.PHONY: console

iex:
	@docker-compose exec --index=$(id) $(env) script/iex
.PHONY: console

run:
	@docker-compose run --rm $(env) $(command)
.PHONY: run

teardown:
	@docker-compose down --volumes --remove-orphans --rmi local
.PHONY: teardown