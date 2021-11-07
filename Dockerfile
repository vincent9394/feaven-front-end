# syntax=docker/dockerfile:1

FROM node:14-alpine as build
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install --production
COPY . .
RUN npm run build

FROM nginx:1.21.3-alpine
COPY --from=build /app/build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
