# PHP Laravel nginx MySQL on Docker

### To install Latest Laravel on Docker:

**git pull** this repo and build Docker images
sudo docker-compose build && sudo docker-compose up -d

### To pull official Laravel repo (in the same location with Dockerfile files)
mkdir src/

git clone https://github.com/laravel/laravel.git src

cd src/

### To install Laravel with all dependencies inside temp container
docker run --rm -v $(pwd):/app composer install

### To install Laravel npm dependencies
sudo docker-compose up -d

### Generate Laravel keys
docker-compose run --rm artisan key:generate

### Config Laravel cache
docker-compose run --rm artisan config:cache

Change DB name, user, password for Laravel app in .env file<br>
In .env file **DB_HOST=**{container_name} (container name in the docker-compose.yml file)

### To build Laravel DB
sudo docker-compose run --rm artisan migrate:install<br>
sudo docker-compose run --rm artisan migrate

### Tear down if needed
sudo docker-compose down

### Stop if needed
sudo docker-compose stop

### To enter a container (sh -- run bash script)
sudo docker-compose exec php sh



