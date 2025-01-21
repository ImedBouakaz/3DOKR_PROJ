FROM node:18-alpine
WORKDIR /application
COPY package.json package-lock.json ./
RUN npm clean-install
COPY . .
EXPOSE 8888
CMD ["node", "server.js"]
