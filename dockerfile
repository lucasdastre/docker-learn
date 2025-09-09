FROM python:3.12

# Evita caches e .pyc
ENV PIP_NO_CACHE_DIR=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Instala o Poetry
RUN pip install poetry==1.8.3

# Pasta de trabalho
WORKDIR /src

# Copie só os manifestos primeiro (melhor cache)
COPY pyproject.toml poetry.lock* ./

# Instala as dependências, sem instalar o projeto em si
RUN poetry config virtualenvs.create false \
 && poetry install --no-root --no-interaction --no-ansi

# Agora copie o restante do código
COPY . .

# Porta padrão do Streamlit
EXPOSE 8501

# Sobe o app
CMD ["poetry", "run", "streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
