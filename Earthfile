
VERSION 0.7

PROJECT earthly-sa/earthly-vs-gha

# main-pipeline:
#   PIPELINE --push 
#   TRIGGER push main 
#   TRIGGER pr main 
#   BUILD +all-test
#   ARG tag=ci-demo
#   BUILD +all-build --go_server_url=http://localhost:8001 --node_server_url=http://localhost:8003 --python_server_url=http://localhost:8002 --rust_server_url=http://localhost:8000 
#   BUILD +all-docker --tag=$tag --base_url=http://localhost

main-local:
  ARG tag=local
  BUILD +all-test
  BUILD +build-services --tag=$tag
  BUILD +build-frontend-local --tag=$tag

main:
  WAIT
    BUILD --platform=linux/amd64 +all-test
    BUILD --platform=linux/amd64 +build-services --tag=ci-demo
    BUILD --platform=linux/amd64 +build-frontend-flyio --tag=ci-demo
  END
  BUILD +deploy-flyio --tag=ci-demo


all-test:
  # BUILD ./rust_server/+test
  BUILD ./go_server/+test
  BUILD ./python_server/+test
  BUILD ./node_server/+test
  BUILD ./quote_client/+test

build-services:
  ARG --required tag
  BUILD ./rust_server/+docker --tag=$tag
  BUILD ./go_server/+docker --tag=$tag
  BUILD ./node_server/+docker --tag=$tag
  BUILD ./python_server/+docker --tag=$tag

build-frontend-local:
  ARG --required tag
  BUILD ./quote_client/+docker --tag=$tag --go_server_url=http://localhost:8001 --node_server_url=http://localhost:8003 --python_server_url=http://localhost:8002 --rust_server_url=http://localhost:8000


build-frontend-flyio:
  ARG --required tag
  BUILD --platform=linux/amd64 ./quote_client/+docker --tag=$tag --go_server_url=https://earthly-go-example.fly.dev --node_server_url=https://earthly-node-example.fly.dev --python_server_url=https://earthly-python-example.fly.dev --rust_server_url=https://earthly-rust-example.fly.dev

deploy-flyio:
  ARG --required tag
  BUILD ./deploy/+deploy-all --tag=$tag


dev-up:
  ARG --required tag
  LOCALLY
  RUN TAG=$tag docker-compose up

dev-down:
  LOCALLY
  RUN docker-compose down
  # bump
