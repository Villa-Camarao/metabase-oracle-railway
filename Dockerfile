# Usa a imagem oficial mais recente do Metabase como base
FROM metabase/metabase:latest

# Define o diretório de plugins (por padrão é /app/plugins)
ENV MB_PLUGINS_DIR /app/plugins

# Copia o driver JDBC da Oracle (ojdbc8.jar) para o diretório de plugins.
# Certifique-se de que o nome do arquivo corresponde ao driver que você baixou.
COPY ojdbc8.jar $MB_PLUGINS_DIR/
