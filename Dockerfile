ARG IMAGE_TAG
FROM mcr.microsoft.com/mssql/server:${IMAGE_TAG}

USER root

# Create a config directory
RUN mkdir -p /usr/config
WORKDIR /usr/config

# Bundle config source
ARG SETUP_SQL_PATH
COPY ${SETUP_SQL_PATH}/setup.sql /usr/config/setup.sql
COPY ./entrypoint.sh /usr/config/entrypoint.sh
COPY ./configure-db.sh /usr/config/configure-db.sh

# Grant permissions for to our scripts to be executable
RUN chmod +x /usr/config/entrypoint.sh
RUN chmod +x /usr/config/configure-db.sh

ENTRYPOINT ["./entrypoint.sh"]