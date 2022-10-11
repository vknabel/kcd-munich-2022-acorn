FROM ruby
WORKDIR /app
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
COPY ./Gemfile /app/Gemfile
COPY ./Gemfile.lock /app/Gemfile.lock
RUN bundle install

ENTRYPOINT ["/app/entrypoint.sh"]
EXPOSE 3000

COPY ./ /app
CMD ["rails", "server", "-b", "0.0.0.0"]
