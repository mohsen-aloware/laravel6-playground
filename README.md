# Laravel 6 Playground
Simple dockerized Laravel 6 playground.

## Terminal Commands
Use `./dev.sh` helper utility to quickly run and work with your docker environment.

#### Start all services
```shell
> ./dev.sh up
```
if you need to rebuild the images:
```shell
> ./dev.sh up --build
```

#### Stop all services
```shell
> ./dev.sh down
```

#### Service status
```shell
> ./dev.sh ps
```

#### Restart services
```shell
> ./dev.sh restart
```
To restart a specific service:
```shell
> ./dev.sh restart php
> ./dev.sh restart nginx
> ./dev.sh restart redis
> ./dev.sh restart mysql
```

#### Access php bash
```shell
> ./dev.sh bash
```

#### Access other services bash
```shell
> ./dev.sh bash php
> ./dev.sh bash nginx
> ./dev.sh bash redis
> ./dev.sh bash mysql
```

#### Execute something within php container
```shell
> ./dev.sh exec ...
```
example:
```shell
> ./dev.sh exec php artisan tinker
> ./dev.sh exec php git status
```

#### Service(s) logs
```shell
> ./dev.sh logs
> ./dev.sh logs php
> ./dev.sh logs nginx
> ./dev.sh logs mysql
> ./dev.sh logs redis
```
