#!/bin/bash
nohup /usr/bin/mongod &
cd /apps/blog/ && npm start
