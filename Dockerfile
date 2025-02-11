# Stage 1: Build the Angular application
FROM node:18 as build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build -- --configuration=production

# Stage 2: Serve the application using Nginx
FROM nginx:alpine
COPY --from=build /app/dist/demo /usr/share/nginx/html
COPY COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
