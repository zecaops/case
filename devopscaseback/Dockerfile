FROM ruby:2.7.7

RUN apt-get update -qq && apt-get install -y nodejs mariadb-client


WORKDIR /app


COPY Gemfile Gemfile.lock ./
RUN bundle install


COPY . .


EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
