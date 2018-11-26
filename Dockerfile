FROM node:11

COPY . .

RUN yarn install

CMD ["yarn", "start"]