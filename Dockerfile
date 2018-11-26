FROM node:11.1.0-alpine as builder

WORKDIR /build

COPY package.json .
COPY yarn.lock .

RUN yarn install

FROM node:11.1.0-alpine

WORKDIR /app

COPY --from=builder /build .

ADD . .

EXPOSE 3000

CMD ["yarn", "start"]
