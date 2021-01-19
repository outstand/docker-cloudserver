FROM outstand/su-exec as su-exec

FROM zenko/cloudserver:latest
LABEL maintainer="Ryan Schlesinger <ryan@outstand.com>"

COPY --from=su-exec /sbin/su-exec /sbin/
RUN chown -R node:node /usr/src/app

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["yarn", "start"]
