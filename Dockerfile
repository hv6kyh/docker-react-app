FROM node:alpine as builder

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY ./ ./

# 왜 CMD가 아닌 RUN?
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /usr/src/app/build /usr/share/nginx/html