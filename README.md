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


## Recommendations
You should pick a observability service like Langfuse, Langsmith, Datadog or Logfire. As this definition can be quite easy to implement with some simple lines of coding inside the application, 