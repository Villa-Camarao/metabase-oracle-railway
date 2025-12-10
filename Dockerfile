# Usa a imagem oficial
FROM metabase/metabase:metabase:v0.57.5.x

# Define o diretório de plugins
ENV MB_PLUGINS_DIR=/app/plugins

# Muda para root para ter permissão de escrita na pasta
USER root

# Copia o driver correto (ojdbc11.jar)
COPY ojdbc11.jar $MB_PLUGINS_DIR/

# Dá permissão de leitura para TODOS os usuários (Owner, Group, Others)
# Isso permite que o usuário do Metabase leia o arquivo, mesmo sendo root o dono.
RUN chmod 644 $MB_PLUGINS_DIR/ojdbc11.jar

# Volta para o usuário padrão do Metabase para rodar a aplicação
USER metabase
