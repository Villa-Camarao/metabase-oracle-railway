FROM metabase/metabase:latest

# Torna-se root temporariamente para garantir que podemos ajustar permissões
USER root

# Define o diretório de plugins
ENV MB_PLUGINS_DIR /app/plugins

# Copia o driver e força permissão de leitura para todos (chmod 644)
COPY ojdbc8.jar $MB_PLUGINS_DIR/
RUN chmod 644 $MB_PLUGINS_DIR/ojdbc8.jar

# Volta para o usuário padrão do container para rodar a aplicação com segurança
# (Geralmente é o usuário 2000 ou 'metabase' na imagem oficial)
USER metabase
