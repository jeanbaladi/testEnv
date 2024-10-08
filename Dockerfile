# Etapa 1: Construcción de la aplicación Angular
FROM node:16.20.1 AS build

# Crear directorio de trabajo
WORKDIR /app

# Copiar package.json y package-lock.json
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar todo el código de la aplicación al directorio de trabajo
COPY . .

# Compilar la aplicación Angular
RUN npm run prebuild
RUN npm run build

# Etapa 2: Servir la aplicación con Nginx
FROM nginx
COPY --from=node /app/dist/battleships /usr/share/nginx/html
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf