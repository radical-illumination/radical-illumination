FROM node:8.11.2-alpine as source
RUN apk add --update --no-cache ca-certificates wget tar git
RUN wget -q 'https://github.com/gohugoio/hugo/releases/download/v0.51/hugo_0.51_Linux-64bit.tar.gz' -O hugo.tar.gz && \
    tar -xzf hugo.tar.gz -C /usr/local/bin
WORKDIR /src/radical-illumination
COPY . .
RUN git clone --depth 1 https://github.com/kishaningithub/hugo-shopping-product-catalogue-simple.git themes/hugo-shopping-product-catalogue-simple
RUN ./extract_data.sh
RUN hugo

FROM nginx:1.14.0-alpine
WORKDIR /opt/radical-illumination
COPY default.template /etc/nginx/conf.d/default.conf
COPY compression.template /etc/nginx/conf.d/compression.conf
COPY .htpasswd .
COPY --from=source /src/radical-illumination/public .