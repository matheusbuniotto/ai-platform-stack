.PHONY: all-up infra-up ui-up all-down infra-down ui-down setup

# Sets up the required external network if it doesn't exist
setup:
	@docker network inspect proxy >/dev/null 2>&1 || (echo "Creating proxy network..." && docker network create proxy)

# Starts all services, ensuring infrastructure is up first
all-up: infra-up ui-up

# Starts the infrastructure services
infra-up: setup
	@echo "Starting infrastructure services..."
	@docker compose -f infrastructure/docker-compose.yml up -d

# Starts the UI services
ui-up:
	@echo "Starting UI services..."
	@docker compose -f ui/docker-compose.yml up -d

# Stops all services
all-down: ui-down infra-down

# Stops the infrastructure services
infra-down:
	@echo "Stopping infrastructure services..."
	@docker compose -f infrastructure/docker-compose.yml down

# Stops the UI services
ui-down:
	@echo "Stopping UI services..."
	@docker compose -f ui/docker-compose.yml down