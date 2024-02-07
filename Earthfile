VERSION 0.8

all-test:
  BUILD ./rust_server/+test
  BUILD ./go_server/+test
  BUILD ./python_server/+test
  BUILD ./node_server/+test
  BUILD ./quote_client/+test

build-services:
  ARG tag=latest
  BUILD ./rust_server/+docker --tag=$tag
  BUILD ./go_server/+docker --tag=$tag
  BUILD ./node_server/+docker --tag=$tag
  BUILD ./python_server/+docker --tag=$tag

dev-up:
  LOCALLY
  WITH DOCKER \
          --load=earthly-demo-react=(./quote_client+docker --go_server_url=http://localhost:8001 --node_server_url=http://localhost:8003 --python_server_url=http://localhost:8002 --rust_server_url=http://localhost:8000) \
          --load=earthly-demo-go=./go_server+docker \
          --load=earthly-demo-rust=./rust_server+docker \
          --load=earthly-demo-node=./node_server+docker \
          --load=earthly-demo-python=./python_server+docker
      RUN docker-compose -f docker-compose.yml up
  END

dev-down:
  LOCALLY
  RUN docker-compose down
  # bump
