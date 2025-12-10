FROM metabase/metabase:latest

# Define o diretório de plugins
ENV MB_PLUGINS_DIR=/app/plugins

# Troca para root para mover arquivos e alterar permissões
USER root

# Copia o driver (agora o ojdbc11.jar)
COPY ojdbc11.jar $MB_PLUGINS_DIR/

# Garante que o arquivo pertença ao usuário 'metabase' e tenha permissão de leitura
# O 'chown' é crucial aqui para evitar erros de permissão silenciosos
RUN chown metabase:metabase $MB_PLUGINS_DIR/ojdbc11.jar && \
    chmod 644 $MB_PLUGINS_DIR/ojdbc11.jar

# Volta para o usuário padrão do Metabase para rodar a aplicação
USER metabase
