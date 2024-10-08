FROM node:16.20.1 AS build
WORKDIR /app
COPY ./ /app/
RUN npm install
RUN npm run prebuild
RUN npm run build

# stage 1, based on Nginx
FROM nginx
COPY --from=node /app/dist/appTest /usr/share/nginx/html
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf