#!/bin/bash
docker build -t yo-dev/flask-tenplate .
docker push yo-dev/flask-tenplate

ssh deploy@$DEPLOY_SERVER << EOF
docker pull digieye/flask-tenplate
docker stop api-boilerplate || true
docker rm api-boilerplate || true
docker rmi digieye/flask-tenplate:current || true
docker tag digieye/flask-tenplate:latest digieye/flask-tenplate:current
docker run -d --restart always --name api-boilerplate -p 5000:5000 digieye/flask-tenplate:current
EOF
