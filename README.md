# IA Platform Starter Stack

## Main services
### Infrastructure
- LiteLLM: Its the default LLM gateway/proxy, used to centralize the provider while also providing an additional layer of security with guardrails and also **some** observability.
- Qdrant: Vector storage
- Tika: Used in OpenWebUI for document processing and understanding, can be replaced with Docling for better performance (probably).
- Postgres DB: Used as a storage for the others services, like LiteLLM.

### UI
- N8N: Default Low-code application for LLM services and agents, you should use LiteLLM end-point as OpenAI Credentials.
- OpenWebUI: Chat interface with advanced features like tools, RAG, knowledge base and code execution.

## How to configure
### Env variables
First, you will need to configure your .env file. An example is provided via .env-example, you need to replace the KEYS and set **YOUR** secrets for the services. As the default embedding model is Gemini, you will need to set a Gemini API Key at least, but you can use another embedding by changing it on litellm-config file.

### LiteLLM Configs
You can configure your LLM gateway with the litellm-config, you can include/remove models, define teams, tags, budget and also set some guardrails/security layer using some service or create it by yourself with CustomGuardrail class in LiteLLM.

## Running
```bash
make all-up # start all services
make infra-up # start infra services
make ui-up # start openwebui and n8n

make all-down # stop all services
make infra-down # stop infra services
make ui-down # stop ui services
```
## Accessing Services
Once the services are up, you can access them at the following URLs:

    LiteLLM UI: http://localhost:4000/ui

    Open WebUI: http://localhost:3000

    n8n: http://localhost:5678

    Qdrant HTTP API: http://localhost:6333

    Qdrant gRPC API: http://localhost:6334

    Tika: http://localhost:9998

#### Note on Service Startup Time

    Please be aware that after running make all-up or make ui-up, some services like Open WebUI and LiteLLM might take a minute or two to fully initialize. The OpenWebUI service includes a health check to help manage its startup, but it's good practice to wait a moment before accessing the UIs. If you see an error, please wait a short while and refresh the page.

## Recommendations

You should pick a observability service (e.g. Langfuse, langsmith, datadog) and integrate it with LiteLLM for improved observability. If security is a concern, please define guardrails in the LiteLLM gateway.