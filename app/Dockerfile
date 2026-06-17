# ---- Build stage ----
# Using the "alpine" variant keeps the base image small (~50MB vs ~900MB
# for the default node image). We only need it here to install deps.
FROM node:20-alpine AS builder

WORKDIR /app

# Copy only the manifest files first so Docker can cache this layer.
# Dependencies only get reinstalled when package.json actually changes,
# not every time application code changes.
COPY package.json package-lock.json* ./
RUN npm install --omit=dev

# ---- Runtime stage ----
# A fresh, minimal image for running the app. Build tools and caches
# from the builder stage never make it into the final image.
FROM node:20-alpine AS runtime

WORKDIR /app

# Running as root inside a container is a common security finding in
# audits. Create an unprivileged user and switch to it before running
# the app.
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY --from=builder /app/node_modules ./node_modules
COPY package.json ./
COPY src ./src

USER appuser

EXPOSE 3000

# Used by Docker/Kubernetes to check container health without needing
# a separate sidecar or external monitoring for basic liveness.
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD node -e "require('http').get('http://localhost:3000/healthz', r => process.exit(r.statusCode === 200 ? 0 : 1)).on('error', () => process.exit(1))"

CMD ["node", "src/index.js"]