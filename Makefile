.PHONY: help generate-data jupyter-up jupyter-down jupyter-restart

help: # Show help for each of the Makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

generate-data: # Generate all data V2
	python scripts/generate_restaurant_descriptions.py --output-directory ./data/restaurants/

jupyter-up: # Spins up the jupyter server
	docker-compose -f ./docker/jupyter/compose.yaml build
	docker-compose -f ./docker/jupyter/compose.yaml up -d
	sleep 5
	docker-compose -f ./docker/jupyter/compose.yaml logs | grep 127.0.0.1 | grep token=

jupyter-down: # Stops the jupyter server
	docker-compose -f ./docker/jupyter/compose.yaml down

jupyter-restart: jupyter-down jupyter-up # Restart the jupyter server