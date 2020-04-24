SHELL := /bin/bash

rs:
	docker-compose run --service-ports --name moocschool --rm web \
	rails s -b 0.0.0.0

up:
	docker-compose up --service-ports --name moocschool --rm web

down:
	docker-compose down