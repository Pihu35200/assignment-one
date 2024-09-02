# Stage 1: Build the application
FROM node:16 as build

WORKDIR /app
COPY . .
RUN npm install && npm run build

# Stage 2: Serve the application with Nginx
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
