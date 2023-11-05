# Laraqa
A Docker image to run PHP Code Analysis on Laravel Projects

 - [PHP CS](https://github.com/squizlabs/PHP_CodeSniffer)
 - [PHP MD](https://phpmd.org/)
 - [PHP Stan](https://phpstan.org/)

## Build
```bash
docker build -t nicolashuber/laraqa .
```

```bash
docker run --name laraqa -it --rm -v /my-src:/app  laraqa
```

# Docker Hub

```bash
docker push nicolashuber/laraqa:latest
```
