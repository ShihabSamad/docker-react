FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# Now /app/build will have all the things we care about

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html