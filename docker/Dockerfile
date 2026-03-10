FROM node:20-slim

# Install Chromium and its dependencies
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxkbcommon0 \
    libxrandr2 \
    xdg-utils \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV CHROME_PATH=/usr/bin/chromium

RUN npm install -g icomoon-cli

# Patch icomoon-cli: Chromy defaults to host:'localhost' which resolves to ::1 in Docker,
# but Chrome only binds to 127.0.0.1. Also add required Docker Chrome flags.
RUN sed -i \
    "s/new Chromy({/new Chromy({ host: '127.0.0.1', chromeFlags: ['--disable-dev-shm-usage', '--no-sandbox'],/" \
    /usr/local/lib/node_modules/icomoon-cli/index.js

WORKDIR /app

COPY generate.sh /usr/local/bin/generate.sh
COPY transform.js /app/transform.js
RUN chmod +x /usr/local/bin/generate.sh

ENTRYPOINT ["generate.sh"]
