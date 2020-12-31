# first phase: BUILDING THE SERVER
FROM node:alpine

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# second phase: RUNNING THE BUILT SERVER
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html