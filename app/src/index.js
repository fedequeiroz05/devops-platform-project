const express = require("express");

const app = express();
const PORT = process.env.PORT || 3000;
const HOSTNAME = require("os").hostname();
const VERSION = process.env.APP_VERSION || "1.0.0";

// Root endpoint — simple proof of life, shows which pod answered.
// Useful later to visually confirm Kubernetes load-balancing across pods.
app.get("/", (req, res) => {
  res.json({
    message: "DevOps Platform Project is running",
    hostname: HOSTNAME,
    version: VERSION,
    timestamp: new Date().toISOString(),
  });
});

// Liveness probe — Kubernetes calls this to know if the container should
// be restarted. Keep this cheap: no external calls, no DB checks.
app.get("/healthz", (req, res) => {
  res.status(200).json({ status: "ok" });
});

// Readiness probe — Kubernetes calls this to know if the pod should
// receive traffic yet. Separated from healthz on purpose: a pod can be
// "alive" but not "ready" (e.g. still warming up or waiting on a dependency).
app.get("/readyz", (req, res) => {
  res.status(200).json({ status: "ready" });
});

app.listen(PORT, () => {
  console.log(`App listening on port ${PORT} (host: ${HOSTNAME})`);
});