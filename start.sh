  #!/bin/bash
  app="nginx-alpine"
  docker build -t ${app} .
  docker run -d -p 56733:80 \
  --name=${app} \
  -v /var/lib/jenkins/workspace/1-Pipline-docker-createbuild:/app ${app}  # mount current folder to container "/app"
