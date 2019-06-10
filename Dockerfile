FROM node:10.16.0-alpine
ENV SSH_PASSWD "root:Docker!"

RUN apk update \
    && apk add --no-cache wget git
    #  nodejs


ENV ROOT_PATH /home/node/app
ADD . $ROOT_PATH
WORKDIR $ROOT_PATH

RUN git clone https://guneraykut@bitbucket.org/guneraykut/pcad-new.git $ROOT_PATH/app
# RUN npm install
# RUN npm install forever -g
WORKDIR /home/node/app/app
RUN npm install
CMD [ "node", "." ]

# COPY entrypoint.sh $ROOT_PATH/entrypoint.sh
# RUN chmod 755 $ROOT_PATH/entrypoint.sh
# ENTRYPOINT [$ROOT_PATH"/entrypoint.sh"]
# CMD ["forever", "start /home/node/app/app/index.js"] 