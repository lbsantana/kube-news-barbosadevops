FROM node:20.10.0-alpine3.18
WORKDIR /app
RUN addgroup -S app && adduser -S app -G app
ENV NODE_ENV=production \
    PORT=8080
COPY package.json package-lock.json ./
# Usa lockfile quando presente; se faltar, faz install para não quebrar o build
RUN if [ -f package-lock.json ]; then npm ci --omit=dev; else npm install --omit=dev; fi
COPY --chown=app:app . .
USER app
EXPOSE 8080
CMD ["node", "server.js"]
