
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
	@echo "$(GREEN)Building files for volumes ... $(RESET)"
	@sudo mkdir -p /home/lcavallu/data/wordpress
	@sudo mkdir -p /home/lcavallu/data/mysql
	@echo "$(GREEN)Building containers ... $(RESET)"
	@sudo docker-compose -f $(COMPOSE_FILE) up --build -d

up:
	@echo "$(GREEN)Building files for volumes ... $(RESET)"
	@sudo mkdir -p /home/lcavallu/data/wordpress
	@sudo mkdir -p /home/lcavallu/data/mysql
	@echo "$(GREEN)Building containers in background ... $(RESET)"
	@docker-compose -f $(COMPOSE_FILE) up -d --build

list:	
	@echo "$(PURPLE)Listing all containers ... $(RESET)"
	sudo docker ps -a

list_volumes:
	@echo "$(PURPLE)Listing volumes ... $(RESET)"
	sudo docker volume ls

clean :	
	@echo "$(RED)Stopping containers ... $(RESET)"
	docker-compose -f $(COMPOSE_FILE) down
	docker conatiner prune --force

fclean: 
	@echo "$(RED)Stopping containers ... $(RESET)"
	@sudo system prune --all --force
	@echo "$(RED)Deleting all volumes ... $(RESET)"
	@-docker volume rm `docker volume ls -q`
	@echo "$(RED)Deleting all network ... $(RESET)"
	@-docker network rm `docker network ls -q`
	@echo "$(RED)Deleting all data ... $(RESET)"
	@sudo rm -rf /home/lcavallu/data/wordpress
	@sudo rm -rf /home/lcavallu/data/mysql
	@echo "$(RED)Deleting all $(RESET)"

.PHONY: run up debug list list_volumes clean