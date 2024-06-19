# Usa la imagen oficial de Node.js versión 16-alpine como base
FROM node:16-alpine

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el package.json y package-lock.json (si existe)
COPY package*.json ./

# Configurar un registro alternativo y aumentar el tiempo de espera de npm
RUN npm set registry https://registry.npmjs.org/ \
    && npm config set fetch-retries 5 \
    && npm config set fetch-retry-mintimeout 20000 \
    && npm config set fetch-retry-maxtimeout 120000

# Verificar la conectividad de red dentro del contenedor (opcional)
RUN apk add --no-cache curl && curl -I https://registry.npmjs.org/

# Instala las dependencias del proyecto
RUN npm install

# Copia el resto de los archivos de la aplicación al contenedor
COPY . .

# Expone el puerto 3000 en el contenedor
EXPOSE 3000

# Comando por defecto para ejecutar la aplicación cuando se inicie el contenedor
CMD ["npm", "start"]

