FROM node:alpine as builder

WORKDIR '/app'
COPY ./package.json ./

#RUN npm config set fetch-rety-mintimeout 2000000
#RUN npm config set fetch-rety-mintimeout 12000000
#RUN npm config set fetch-retries 4 

#RUN npm install -g npm@8.18.0
RUN npm install --no-audit

COPY . .
RUN npm run build

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html
 

#CMD ["npm","run","start"]