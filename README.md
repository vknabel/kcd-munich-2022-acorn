# README

Steps to reproduce:

1. Create a new rails app

```bash
echo 'gem install rails && rails new . --skip-webpack-install --database=postgresql' | docker run -i --rm -v $PWD:/app -w /app ruby sh
```

2. Whitelist `*.local.on-acorn.io` in `config.ru`

```ruby
Rails.application.configure do
    config.hosts << "*.local.on-acorn.io"
end
```

3. Enable environment variables for Postgres in `config/database.yml`

```yaml
default: &default
  #...
  # add these
  host: <%= ENV.fetch("DATABASE_HOST") { "db" } %>
  database: <%= ENV.fetch("DATABASE_NAME") { "rails-example" } %>
  username: <%= ENV.fetch("DATABASE_USERNAME") { "rails-example" } %>
  password: <%= ENV.fetch("DATABASE_PASSWORD") { "rails-example" } %>

#...
test:
  <<: *default
  # remove existing

#...
production:
  <<: *default
  # remove existing
```

4. Add Acornfile, Dockerfile and entrypoint.sh

5. Ensure you can connect to your Docker Desktop with kubectl

6. Run `acorn install`

7. Run `acorn run .` or `acorn run -i .` for development mode

8. Add the `*.local.on-acorn.io` domain to your `/etc/hosts` file. For example:

```
127.0.0.1       server-holy-water-ab5e9d1e.local.on-acorn.io
```
