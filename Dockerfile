FROM mcr.microsoft.com/playwright:v1.42.1-jammy

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npx playwright install --with-deps

RUN npm install -D allure-playwright

CMD ["npx","playwright","test","--reporter=line,allure-playwright"]