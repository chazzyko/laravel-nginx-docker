# laravel-nginx-docker

# To install Latest Laravel on Docker

# Git pull this repo
sudo docker-compose build && sudo docker-compose up -d

# To pull Laravel repo (src/ - in the same location with Dockerfile)
mkdir src/
git clone https://github.com/laravel/laravel.git src
cd src/

# To install Laravel with all dependencies inside temp container
docker run --rm -v $(pwd):/app composer install
sudo docker-compose run --rm npm install && npm run dev

# Generate Laravel keys
docker-compose run --rm artisan key:generate
docker-compose run --rm artisan config:cache

# Change DB user password for Laravel in .env file 

# To build Laravel DB
sudo docker-compose run --rm artisan migrate

# Tear down if needed
sudo docker-compose down

# Stop if needed
sudo docker-compose stop

# To enter a container (sh -- run bash script)
sudo docker-compose exec php sh


