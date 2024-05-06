#!/bin/bash
# This script starts the ollama server and serves the llama3 models

# Provide ollama if not availale
if ! command -v ollama &> /dev/null; then
        curl -fsSL https://ollama.com/install.sh | sh
fi

# Start the ollama server
ollama serve&

# If llama3 not present pull llama3
if ! (ollama list llama3|grep llama3) &> /dev/null; then
        ollama pull llama3
fi

# Serve the llama3 models
ollama run llama3&
