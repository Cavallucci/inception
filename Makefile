
BLACK		:= $(shell tput -Txterm setaf 0)
RED		:= $(shell tput -Txterm setaf 1)
GREEN		:= $(shell tput -Txterm setaf 2)
YELLOW		:= $(shell tput -Txterm setaf 3)
LIGHTPURPLE	:= $(shell tput -Txterm setaf 4)
PURPLE		:= $(shell tput -Txterm setaf 5)
BLUE		:= $(shell tput -Txterm setaf 6)
WHITE		:= $(shell tput -Txterm setaf 7)
RESET		:= $(shell tput -Txterm sgr0)

COMPOSE_FILE=./srcs/docker-compose.yml

all: run

run: 
	@sudo mkdir -p /home/lcavallu/data/wordpress
	@sudo mkdir -p /home/lcavallu/data/mysql
	@sudo docker-compose -f $(COMPOSE_FILE) up --build -d

list:	
	@sudo docker container ps -a ; sudo docker images

clean :	
	@sudo docker-compose -f $(COMPOSE_FILE) down
	@sudo docker container prune --force

fclean: clean
	-sudo docker stop `sudo docker ps -qa`
	-sudo docker rm `sudo docker ps -qa`
	-sudo docker rmi -f `sudo docker images -qa`
	-sudo docker volume rm `sudo docker volume ls -q`
	-sudo docker network rm `sudo docker network ls -q 2>/dev/null`
	sudo rm -rf /home/lcavallu/data/wordpress
	sudo rm -rf /home/lcavallu/data/mysql

re: fclean run

.PHONY: run up debug list list_volumes clean