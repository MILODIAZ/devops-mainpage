FROM node:16-alpine

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install --verbose

COPY . .

EXPOSE 8000

CMD ["npm", "start"]
