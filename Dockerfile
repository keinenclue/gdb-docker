FROM ghcr.io/sosedoff/pgweb:0.11.10 as pgweb


FROM postgres:15-alpine

COPY --from=pgweb /usr/bin/pgweb /usr/bin/pgweb
COPY entrypoint.sh /entrypoint.sh
COPY uni_schema.sql /docker-entrypoint-initdb.d/
USER 70

ENV POSTGRES_HOST_AUTH_METHOD=trust

EXPOSE 8081

ENTRYPOINT ["/entrypoint.sh"]
