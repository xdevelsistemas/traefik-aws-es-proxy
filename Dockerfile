FROM traefik:1.7-alpine

COPY traefik.toml /traefik.toml

ADD entrypoint.sh /

RUN chmod a+x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["traefik"]
