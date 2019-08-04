# Traefik proxy for AWS elasticsearch service

## The problem

the major problem with elasticsearch service is the access for developers.

There are two elasticsearch vpc's configuration:

- public domain

- private domain inner vpc

The second option is better because this reduce atack surface in all your cloud resources.

![Private vpc](https://i.postimg.cc/qRkktCmQ/VPCNo-Zone-Awareness.png)

## Solution

We can increment a proxy with Application load balancer and authenticate the access with Cognito.

![Solution](https://i.postimg.cc/vmw8sKfJ/solution.png)

This image create conteiner with configured proxy between public access and private domain.

## Compose example

```yaml
version: "3"

services:
  app:
    image: xdevelsistemas/traefik-aws-es-proxy:stable
    environment:
      - EXTERNAL_DOMAIN=<YOUR-PUBLIC-DOMAIN>
      - VPC_DOMAIN=<YOUR-VPC-DOMAIN>
    restart: always
    ports:
      - "80:80"
      - "8080:8080"
```

You can monitor with "traefik monitor" in 8080's port


## Tips

More about authenticate AWS Load Balancer:

https://medium.com/@sandrinodm/securing-your-applications-with-aws-alb-built-in-authentication-and-auth0-310ad84c8595
