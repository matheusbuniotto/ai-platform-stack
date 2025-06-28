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
	@echo "-------------"
	@echo "Infrastructure services are starting. They will be available at:"
	@echo "  - LiteLLM UI: http://localhost:4000"
	@echo "  - Tika: http://localhost:9998"
	@echo "  - Qdrant HTTP API: http://localhost:6333"
	@echo "-------------"

# Starts the UI services
ui-up:
	@echo "Starting UI services..."
	@docker compose -f ui/docker-compose.yml up -d
	@echo "-------------"
	@echo "UI services are starting. They will be available at:"
	@echo "  - Open WebUI: http://localhost:3000"
	@echo "  - n8n: http://localhost:5678"
	@echo ""
	@echo "Note: It might take a minute or two for the services to be fully available."
	@echo "-------------"

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