FROM ruby:3.1.2

WORKDIR /app

RUN apt-get update -qq && apt-get install -y nodejs

RUN gem install rails bundler

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

# RUN rails db:create db:migrate db:seed

CMD ["rails", "server", "-b", "0.0.0.0"]