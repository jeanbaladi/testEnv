FROM node:16.20.1 as node
WORKDIR /app
COPY ./ /app/
RUN npm install
# RUN npm run prebuild
RUN -e API_URL=https://api.example.com -e DB_HOST=localhost -e DB_PORT=5432 my-node-app

# ***********
RUN cd scripts
RUN npm install
RUN node set-enviroment.js
RUN cd ..
# ***********

RUN npm run build

# stage 1, based on Nginx
FROM nginx
COPY --from=node /app/dist/appTest /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf