FROM node:12

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --only=production

COPY . .

RUN npm run flow-typed

RUN npm run build

EXPOSE 8080
CMD [ "npm", "run", "serve" ]

FROM node:12

WORKDIR /usr/src/app

COPY package*.json ./

# Environment variables must be set
ENV VUE_APP_URL="http://localhost:8080/"
ENV VUE_APP_SERVER="http://localhost:4000/"
ENV VUE_APP_CDN="http://localhost:4000/"
