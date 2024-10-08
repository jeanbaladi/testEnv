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
RUN npm run build -- --prod

# Etapa 2: Servir la aplicación con Nginx
FROM nginx:alpine

# Eliminar el contenido por defecto de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copiar la aplicación construida desde la etapa anterior
# COPY nginx.conf /etc/nginx/nginx.conf

# Exponer el puerto 80
EXPOSE 80

# Iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]