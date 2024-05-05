FROM node:latest
RUN wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | gpg --dearmor > packages.mongodb.gpg
RUN install -D -o root -g root -m 644 packages.mongodb.gpg /etc/apt/keyrings/packages.mongodb.gpg
RUN echo "deb [ arch=amd64,arm64 signed-by=/etc/apt/keyrings/packages.mongodb.gpg] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list
RUN rm -f packages.mongodb.gpg
RUN apt update && apt upgrade
RUN apt-get install -y mongodb-org
RUN mkdir -p /apps/blog
ADD node /apps/blog/
RUN mkdir /data/db/27017 -p
