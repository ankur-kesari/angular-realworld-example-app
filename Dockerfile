FROM node:14 as build
COPY . /
WORKDIR /angular-realworld-example-app/
RUN npm install -g @angular/cli
RUN yarn install
RUN yarn build

FROM httpd
COPY --from=build /angular-realworld-example-app/dist/ ./htdocs/
EXPOSE 80


