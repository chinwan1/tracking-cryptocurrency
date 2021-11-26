FROM node:10 AS builder
WORKDIR /app
COPY package.json ./
RUN npm install 
COPY . ./
RUN yarn run build


FROM node:10
WORKDIR /app
RUN mkdir build
RUN mkdir server 
RUN mkdir public 
COPY --from=builder /app/build/. build
COPY --from=builder /app/server/. server
COPY --from=builder /app/public/. public
RUN npm install express
ENTRYPOINT ["node", "server/server.js"]