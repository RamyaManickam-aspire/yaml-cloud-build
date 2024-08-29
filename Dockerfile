# Base image
FROM node:latest as node
RUN echo "stage1"
# Working directory
WORKDIR /app
RUN echo "stage2"
# Copy app source
COPY . .
RUN echo "stage3"
# Install dependencies
RUN npm install
RUN echo "stage4"
RUN npm run build
RUN echo "stage5"
FROM nginx:alpine
RUN echo "stage6"

COPY --from=node app/dist/yaml-cloud-build/browser /usr/share/nginx/html
RUN cat /usr/share/nginx/html/index.html
EXPOSE 80