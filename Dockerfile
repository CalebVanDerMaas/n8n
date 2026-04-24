FROM node:20-alpine

RUN apk add --no-cache tini

RUN npm install -g n8n && \
    rm -rf /root/.npm /tmp/*

RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV NODE_ENV=production

USER node
WORKDIR /home/node

ENTRYPOINT ["tini", "--"]
CMD ["/entrypoint.sh"]
