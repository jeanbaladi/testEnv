FROM node:16.20.1 as node
WORKDIR /app
COPY ./ /app/
RUN npm install

# ***********
# with nodejs
# RUN cd ./scripts && npm install && node set-enviroment.js
# with dotnet
# Etapa para el mini proyecto de .NET
# Establecer el directorio de trabajo para el mini proyecto .NET
WORKDIR /app/dotnetRewriter/EnvironmentRewritter

# Copiar los archivos del mini proyecto .NET al contenedor
COPY dotnetRewriter/EnvironmentRewritter ./

# Restaurar paquetes NuGet
RUN dotnet restore

# Construir el proyecto .NET
RUN dotnet build -c Release

# Ejecutar el proyecto .NET para sobrescribir environment.ts
CMD ["dotnet", "run"]
# ***********

RUN npm run build

# stage 1, based on Nginx
FROM nginx
COPY --from=node /app/dist/appTest /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf