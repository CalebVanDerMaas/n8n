#!/bin/sh
# Heroku sets PORT dynamically; n8n uses N8N_PORT
export N8N_PORT="${PORT:-5678}"
exec n8n start
