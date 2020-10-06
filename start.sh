  #!/bin/bash
  app="docker.test"
  docker build -t ${app} /home/uu/docker-test-app/
  docker run -d -p 56733:80 \
  --name=${app} \
  -v /home/uu/docker-test-app:/app ${app}  # mount current folder to container "/app"
