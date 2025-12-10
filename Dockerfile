# Mantém a versão que você está usando
FROM metabase/metabase:v0.57.5.x

# Define o diretório de plugins
ENV MB_PLUGINS_DIR=/app/plugins

# Muda para root para fazer as alterações
USER root

# Cria o diretório (caso não exista) para garantir
RUN mkdir -p $MB_PLUGINS_DIR

# Copia o driver ojdbc11.jar
COPY ojdbc11.jar $MB_PLUGINS_DIR/

# A CORREÇÃO MÁGICA:
# Usamos 'chown -R 2000:2000' (recursivo) usando o ID numérico.
# Isso garante que a PASTA e o ARQUIVO pertençam ao usuário que roda o Metabase.
# Funciona em qualquer Linux, independente do nome do usuário ser 'metabase' ou outro.
RUN chown -R 2000:2000 $MB_PLUGINS_DIR && \
    chmod 755 $MB_PLUGINS_DIR && \
    chmod 644 $MB_PLUGINS_DIR/ojdbc11.jar

# Volta para o usuário padrão do container (ID 2000)
USER 2000
