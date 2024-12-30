FROM node:22-alpine3.20 as base

WORKDIR /app

COPY package.json package-lock.json /app/

RUN npm install
COPY . .

FROM base as test
RUN npm run test

FROM base as development
RUN npm run dev

FROM base as production
RUN npm run build

EXPOSE 8080


CMD ["npm", "run", "preview"]