FROM ruby:2.6.5
# RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install bundler
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
# ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000