# Dispatch Service.

## This service is written is GO, But here the code is already compiled. So we will just use the binary and run it.

1. Create a user to run the servie 

```
# useradd dispatch
```

2. Clone the repo as user.

**Use Git Clone to get code**

3. Need to import `dispatch` service to the system, To manage with `systemctl`.

```
# cp /home/dispatch/dispatch/dispatch.service /etc/systemd/system/dispatch.service
# systemctl daemon-releoad
# systemctl enable dispatch 
# systemctl start dispatch
```


**NOTE:-**

This application need to connect to RabbitMQ, So it needs to connect to it. So in order to connect it needs an username and password, and