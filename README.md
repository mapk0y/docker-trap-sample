## docker stop/kill で trap がちゃんと動作するかのテスト

テスト環境

- ubuntu 14.04
- docker 1.8.2 (w/aufs)

## build

```console
$ docker build --no-cache -t traptest .
```

## test

### SIGTERM の場合

```console
$ docker run -d --name traptest traptest
a66ebcf4ad97349a5bface56b467b3c30231acd7efa296a2b26b1a9767f5825c
$ docker logs traptest
start sleep
$ docker stop traptest 
traptest
$ docker logs traptest 
start sleep
stopping by SIGTERM
stop sleep
```

### SIGKILL の場合

当然捕まえることはできない

```console
$ docker run -d --name traptest traptest                                                                                                                                                                     
db79eebc38c8128a98df0f0e532e9d78ba2c8444292e0f80132839940af3600a
$ docker logs traptest                                                                                                                                                                                       
start sleep
$ docker kill traptest 
traptest
$ docker logs traptest 
start sleep
```

