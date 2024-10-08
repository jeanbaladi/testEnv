# Etapa 1: Construcción de la aplicación Angular
FROM node:16.20.1 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build -- --prod

# Etapa 2: Servir la aplicación con Nginx
FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY --from=build /app/dist/[nombre-de-tu-app] /usr/share/nginx/html

# Copiar el archivo de configuración personalizado de Nginx
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
