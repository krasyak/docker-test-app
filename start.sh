  #!/bin/bash
  app="docker.test"
  docker build -t ${app} .
  docker run -d -p 56733:80 \
  --name=${app} \
  -v .:/app ${app}  # mount current folder to container "/app"
