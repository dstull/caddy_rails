FROM jumanjiman/caddy:v0.11.0-20181002T1350-git-3d0ba71

USER root

COPY caddyfile /etc/caddy/caddyfile
COPY init.sh /usr/bin
COPY healthcheck /var/opt/healthcheck

RUN apk add --update \
		libcap \
		&& rm -rf /var/cach/apk/*

RUN setcap cap_net_bind_service=+ep /usr/sbin/caddy

VOLUME /tmp

USER caddy

ENTRYPOINT ["/usr/bin/init.sh"]