# README

[![Rails Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop-rails)

**Visita la app [aquí](https://hobbies-app-grupo32.herokuapp.com/)**

### Pasos para el setup

1. Clonar el repositorio y correr `bin/bundle install` (asegurarse de que la version de ruby es la misma que sale en el `.ruby-version`)
2. Correr `bin/setup`
3. Para la base de datos usamos postgres dentro de docker. Una vez instalado docker, corre `docker compose up -d`
4. Para hacer el setup y migraciones de la base de datos, correr `bin/rails db:setup`
5. Para correr el proyecto, ejecutar `bin/rails s` en una terminal, y `bin/webpack-dev-server` en otra

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
