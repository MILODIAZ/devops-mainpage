FROM node:16-alpine

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install --timeout=0

COPY . .

EXPOSE 8000

CMD ["npm", "start"]
