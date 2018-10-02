FROM nginx:1.11-alpine
COPY ./dist /usr/shar/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]