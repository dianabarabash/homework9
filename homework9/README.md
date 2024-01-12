Hometask #9
===========

1. Create with aws cli ec2 instance from Ubuntu image (ami-053b0d53c279acc90)
2. Setup docker via user data on your instance (see documentation). Docker should listen on  instance local tcp 
port 127.0.0.1:2375 (see documentation). Do not forget add ubuntu user to docker group.  See next slide for connection diagram.
3. Write on your local computer Dockerfile for nginx server setup based on centos:centos7 docker image. 
Use Hometask#1 as example. SELinux and systemctl are not used in this case. Create some content for your web server 
in ./html folder. Update Dockerfile to copy local ./html folder to your instance web content folder. 
4. Create local port (5566) forwarding tunnel to your instance using ssh (see Hometask #7)
5. Run localy docker build (docker -H localhost:5566 build … ) command to build docker image on your instance.
6. Run nginx docker container as daemon on your instance tcp port 80 (docker -H localhost:5566 run … )

Check your server in browser: http://<your_instance_ip>

Guide
-----

- Originate local port forwarding
```bash
ssh -i diana-key-pair.pem -L 5566:localhost:2375 ubuntu@ip-address-ec2-instance 
```

- Build the image on the remote docker process
```bash
docker -H localhost:5566 build . -t diana_nginx
```

- Run the image on the remote docker process
```bash
docker -H localhost:5566 run -p 80:80 diana_nginx
```
