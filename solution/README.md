Command for first step: docker run --name infracloud -d infracloudio/csvserver:latest
Container got exited due to missing file in /csvserver/inputdata directory inside container. This could be found using docker logs for the container id or name.
gencsv.sh file was written to generate a random inputFile.
inputFile generated was then mounted to the new container after deleting the old container using command
docker run --name infracloud -d -v /root/csvserver/inputFile:/csvserver/inputdata infracloudio/csvserver:latest
Get the shell access to the container using below:
docker exec -it infracloud bash
Get the listen port by running below command from inside container:
netstat -nap | grep -i listen -- It is 9300 for this container
exit the container by typing exit and then use docker rm -f infracloud to delete the container.
Now, run the below command to map localhost port 9393 to 9300 port of container and also pass CSVSERVER_BORDER as env variable during docker run:
docker run --name infracloud -d -v /root/Infracloud/InfraCloudTest/solution/inputFile:/csvserver/inputdata -p 127.0.0.1:9393:9300 --env CSVSERVER_BORDER=Orange infracloudio/csvserver:latest
