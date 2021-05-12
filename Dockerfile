#FROM node:14.15.0 as builder
#
#WORKDIR /opt/ferry_web
#COPY . .
#
#RUN npm install -g cnpm --registry=https://registry.npm.taobao.org && cnpm install
#RUN npm run build:prod

FROM nginx

#COPY --from=builder /opt/ferry_web/web /opt/web
WORKDIR /app/web
COPY ./web/ ./
RUN rm -f /etc/nginx/conf.d/*
COPY ./ferry_web.conf /etc/nginx/conf.d/
CMD ["nginx", "-g", "daemon off;"]
