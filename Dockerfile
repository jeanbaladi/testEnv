FROM node:16.20.1 as node
WORKDIR /app
COPY ./ /app/
RUN npm install

# ***********
RUN cd ./scripts && npm install && node set-enviroment.js
# ***********

RUN npm run build

# stage 1, based on Nginx
FROM nginx
COPY --from=node /app/dist/appTest /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf