start-dev: 
	docker compose -f docker-compose.dev.yml up --build

stop-dev:
	docker compose -f docker-compose.dev.yml down -v

start-prod: 
	sudo docker compose -f docker-compose.yml up --build

stop-prod:
	sudo docker compose -f docker-compose.yml down -v