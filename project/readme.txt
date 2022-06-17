generate protobuf command

protoc --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative logs.proto
-------------------------------------------------------------------------------------------------------------------
docker login problem:
Error saving credentials: error storing credentials - err: exit status 1, out: `error storing credentials - err: exit status 1, out: `pass not initialized: exit status 1: Error: password store is empty. Try "pass init".``

- solution from: https://stackoverflow.com/questions/50151833/cannot-login-to-docker-account

docker logout
mv ~/.docker/config.json ~/.docker/config_old.json
docker login

docker build
 -> docker build -f broker-service.dockerfile -t superdit/broker-service:1.0.0 .
 -> docker push superdit/broker-service:1.0.0

docker swarm
-------------------------------------------------------------------------------------------------------------------
docker swarm init

docker swarm init --advertise-addr 192.168.99.121
-->
docker swarm join --token SWMTKN-1-4vzh95ajn7e985czd7513i2uejkv2i5xffgtmqh0chmgsixlxg-c2e9zcaxxlix5y0rw951kwq3r 192.168.88.231:2377

kalo token nya lupa

docker swarm join-token worker

docker swarm join-token manager

docker stack deploy -c swarm.yml myapp

docker stack rm myapp

docker swarm leave -f