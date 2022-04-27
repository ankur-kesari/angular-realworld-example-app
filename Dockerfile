FROM node:14 as build
COPY . /app
WORKDIR /app
RUN yarn install
RUN yarn build

FROM httpd
COPY --from=build /app/dist/ ./htdocs
EXPOSE 80
