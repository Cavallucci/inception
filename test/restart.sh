sudo docker container kill 1th-try
sudo docker container rm -f 1th-try
sudo docker image rm simple-test
sudo docker build -t simple-test .
sudo docker container run --name=1th-try -d -p 9300:80 simple-test