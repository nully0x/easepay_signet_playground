start-dev: 
	docker compose -f docker-compose.dev.yml up --build

stop-dev:
	docker compose -f docker-compose.dev.yml down

start-prod: 
	docker compose -f docker-compose.yml up --build

stop-prod:
	docker compose -f docker-compose.yml down -v