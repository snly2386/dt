# can tag from as alias for different phases
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#run phase - a second from statement will start up new phase
FROM nginx 
#copy from builder phase
COPY --from=builder /app/build /usr/share/nginx/html
#default command of nginx will start up nginx

# map port to :80 - nginx default