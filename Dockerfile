ARG PG_VERSION="18.2"
FROM postgres:${PG_VERSION}-bookworm

# Install extensions via APT
RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-18-pgvector \
    postgresql-18-partman= \
    && rm -rf /var/lib/apt/lists/*

# Configure libraries to preload
RUN echo "shared_preload_libraries = 'pg_partman_bgw'" >> /usr/share/postgresql/postgresql.conf.sample
