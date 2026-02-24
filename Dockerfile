ARG PG_VERSION="18.2"
FROM postgres:${PG_VERSION}-bookworm
ARG PG_VECTOR_VERSION="0.8.1"
ARG PG_PARTMAN_VERSION="5.2.4"

# Install extensions via APT
RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-18-pgvector="${PG_VECTOR_VERSION}*" \
    postgresql-18-partman="${PG_PARTMAN_VERSION}*" \
    && rm -rf /var/lib/apt/lists/*

# Configure libraries to preload
RUN echo "shared_preload_libraries = 'pg_partman_bgw'" >> /usr/share/postgresql/postgresql.conf.sample
