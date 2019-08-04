#!/bin/sh

sed -i 's/es_vpc_domain/'$VPC_DOMAIN'/g' traefik.toml
sed -i 's/es_external_domain/'$EXTERNAL_DOMAIN'/g' traefik.toml

exec "$@"
