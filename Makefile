
.PHONY: infra-up ui-up all-up all-down infra-down ui-down

infra-up:
	docker compose up -d litellm litellm_db qdrant tika
	@echo "Infrastructure services are starting..."
	@echo "LiteLLM available at: http://localhost:4000"
	@echo "Qdrant available at: http://localhost:6333 (HTTP) and http://localhost:6334 (gRPC)"
	@echo "Tika available at: http://localhost:9998"
	@echo "Wait some seconds for the services to be fully up..."

ui-up:
	docker compose up -d n8n openwebui
	@echo "UI services are starting..."
	@echo "N8N available at: http://localhost:5678"
	@echo "OpenWebUI available at: http://localhost:3000"
	@echo "Wait some seconds for the services to be fully up..."

all-up:
	docker compose up -d
	@echo "All services are starting..."
	@echo "LiteLLM available at: http://localhost:4000"
	@echo "Qdrant available at: http://localhost:6333 (HTTP) and http://localhost:6334 (gRPC)"
	@echo "Tika available at: http://localhost:9998"
	@echo "N8N available at: http://localhost:5678"
	@echo "OpenWebUI available at: http://localhost:3000"

infra-down:
	docker compose down litellm litellm_db qdrant tika
	@echo "Infrastructure services are stopping..."

ui-down:
	docker compose down n8n openwebui
	@echo "UI services are stopping..."

all-down:
	docker compose down
	@echo "All services are stopping..."
