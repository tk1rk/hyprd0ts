docker run -p 8080:8080 \
  -v "/srv/coder:/home/coder/project" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  -e "PASSWORD=c0d3r" \
  -it bencdr/code-server-deploy-container:latest