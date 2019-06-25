# phpssdbadmin-docker
SSDB PhpSSDBAdmin Dockerfile


## Usage:

```
$ docker run --name phpssdbadmin -d -p 80:80 jpnkls/psa
```


## Add configuration parameters like this:

```
$ docker run \
  --name phpssdbadmin \
  -d \
  -p 80:80 \
  -v /path/to/phpssdbadmin/config.php:/var/www/html/app/config/config.php \
  jpnkls/psa
```
