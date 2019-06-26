FROM jumanjiman/caddy:v0.11.0-20181002T1350-git-3d0ba71

USER root

COPY src/caddyfile /etc/caddy/caddyfile
COPY src/init.sh /usr/bin
COPY src/healthcheck /var/opt/healthcheck

RUN apk add --no-cache \
			libcap \
			&& \
		:

RUN setcap cap_net_bind_service=+ep /usr/sbin/caddy

VOLUME /tmp

USER caddy

ENTRYPOINT ["/usr/bin/init.sh"]