FROM node:alpine AS builder

WORKDIR /app

COPY package.json .

RUN yarn

COPY . .

RUN yarn build

FROM nginx

EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html
