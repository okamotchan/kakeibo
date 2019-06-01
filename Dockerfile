FROM ruby:2.4.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /kakeibo
WORKDIR /kakeibo
COPY Gemfile /kakeibo/Gemfile
COPY Gemfile.lock /kakeibo/Gemfile.lock
RUN bundle install
COPY . /kakeibo
# ENV BUNDLER_VERSION 2.0.1
# RUN gem install bundler && bundle install --jobs 20 --retry 5

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
