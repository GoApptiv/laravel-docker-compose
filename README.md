# Laravel in Docker Compose

This is the GoApptiv Docker Compose template for [Laravel](https://laravel.com/) with different support PHP version and Nginx Load Balancer for Scaling.

## How to use this template

This Docker Compose template provisions a php container with a nginx load-balancer. After running the template, the `nginx` load-balancer will be the entrypoint to php.

To run this template execute :

```bash
docker-compose up -d

# Three laravel instance
docker-compose up --scale php=3 -d
```

```bash
# Installing composer
docker-compose exec php composer install
```

```bash
# Bring down the app stack
docker-compose down
```

Laravel will be available through the `nginx` instance on port `80` and `443`.

## Issues

If you have any problems with or questions about this image, please contact us through a GitHub issue.
