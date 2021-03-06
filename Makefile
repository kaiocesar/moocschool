SHELL := /bin/bash

bu:
	docker-compose build web

ug:
	docker-compose run --rm web bundle
	
dba:
	docker-compose run web rake db:create db:migrate

cs:
	docker-compose exec web rails console

up:
	docker-compose up --build

dw:
	docker-compose down


deletepid:
	rm tmp/pids/server.pid 
