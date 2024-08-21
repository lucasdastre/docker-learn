FROM python:3.12

# Instala o Poetry
RUN pip install poetry

# Copia o código fonte para o contêiner
COPY . /src

# Define o diretório de trabalho
WORKDIR /src

# Instala as dependências usando Poetry
RUN poetry install

# Expõe a porta 8501 para acessar o Streamlit
EXPOSE 8501

# Define o comando de entrada para rodar o Streamlit
CMD ["poetry", "run", "streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]

