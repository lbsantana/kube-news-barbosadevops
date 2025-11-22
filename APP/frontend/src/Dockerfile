FROM node:20.10.0-alpine3.18
WORKDIR /app
RUN addgroup -S app && adduser -S app -G app
ENV NODE_ENV=production \
    PORT=8080
COPY package*.json ./
RUN npm ci --omit=dev
COPY --chown=app:app . .
USER app
EXPOSE 8080
CMD ["node", "server.js"]
