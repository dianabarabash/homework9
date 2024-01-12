Hometask #9
===========

-----

- Start instance
```bash
./run-and-provision.sh
```

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
