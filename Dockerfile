FROM node
WORKDIR /app
COPY package.json .
# RUN npm install
# RUN npm install --only=production

ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install; \
        else npm install --only=production; \
        fi
COPY . ./
ENV PORT 3000
EXPOSE ${PORT}
# CMD ["npm", "run", "dev"]
CMD [ "node", "index.js" ]



