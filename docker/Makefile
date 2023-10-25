build:
	docker-compose build --no-cache --force-rm >> build.log 2>&1
stop:
	docker-compose stop
start:
	docker-compose start
up:
	docker-compose up -d >> build_up.log 2>&1
prune:
	docker-compose down
	docker rmi $$(docker images -q)
	docker system prune -f
boot_mysql:
	docker exec -it webike_mysql bash
boot_app:
	docker exec -it webike_app bash
