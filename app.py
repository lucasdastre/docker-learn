import streamlit as st

# Definir o tema da aplicação
st.set_page_config(page_title="Minha Aplicação", page_icon=":guardsman:", layout="wide")

# Personalizar o estilo da página
st.markdown(
    """
    <style>
    .main {
        background-color: #CCCCCC;
    }
    </style>
    """,
    unsafe_allow_html=True
)

def hello_world():
    return "Hello World!"

def main():
    st.title("Minha Aplicação Streamlit")
    st.write("Hello World!")

    st.sidebar.title("Menu")
    st.sidebar.write("Aqui você pode adicionar itens de menu")

    st.write("Esta é uma aplicação Streamlit com fundo branco e uma interface simples.")

if __name__ == "__main__":
    main()
