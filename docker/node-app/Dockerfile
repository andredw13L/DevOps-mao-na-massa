FROM node:alpine

RUN addgroup -S app && adduser -S app -G app

WORKDIR /usr/app

RUN chown -R app:app /usr/app 

USER app:app

COPY ./package.json ./package.json

RUN npm install --ignore-scripts

COPY ./index.js ./index.js

CMD [ "npm", "start" ]
