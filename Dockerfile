# Usa a imagem que você escolheu
FROM metabase/metabase:v0.57.5.x

# Define variável do diretório
ENV MB_PLUGINS_DIR=/app/plugins

# Entra como root para poder copiar e alterar permissões
USER root

# Copia o driver NOVO (ojdbc11.jar)
# Certifique-se que o arquivo na pasta tem EXATAMENTE este nome
COPY ojdbc11.jar $MB_PLUGINS_DIR/

# Dá permissão de leitura para TODOS (User, Group, Others)
# Isso resolve o problema de permissão sem precisar do comando 'chown' que falhou
RUN chmod 644 $MB_PLUGINS_DIR/ojdbc11.jar

# Define o usuário padrão do container pelo ID (2000)
# Usar o ID é mais seguro que o nome 'metabase' em algumas versões do Linux
USER 2000
