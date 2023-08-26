FROM ruby:2.7.2-alpine as app

ENV INSTALL_PATH /usr/src
RUN mkdir -p $INSTALL_PATH

RUN apk add --no-cache build-base bash git libpq postgresql libxml2-dev postgresql-dev postgresql-client redis

RUN gem install bundler


WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .
# initialize firebase at some point
# rake firebase:certificates:request
# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]

EXPOSE 3000

# Start the main process.
CMD [ "rails", "server", "-b", "0.0.0.0" ]
