# Coral Trait database


### Heroku

```
heroku restart
heroku pg:reset DATABASE
heroku run rake db:migrate
```

https://devcenter.heroku.com/articles/heroku-postgres-import-export

```
pg_dump -Fc --no-acl --no-owner -h localhost -U deployer -d coraltraits_development -f coraltraits_development.dump


# Need to get link for dump from Dropbox.
heroku pg:backups:restore --app peaceful-spire-47510 --confirm peaceful-spire-47510 "https://www.dropbox.com/scl/fi/y3w2y8x6kkq49eoqeg2js/coraltraits_development.dump?rlkey=tyjx9x726w5vvsu1px0mpjrls&dl=0"

heroku run rake sunspot:reindex

heroku pg:psql

```

# HEROKU WEBSOLR
https://devcenter.heroku.com/articles/websolr


### Postgres

```
rake db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1
rake db:create
rake db:migrate
rake db:seed
rake sunspot:solr:reindex
```

# SPECIES
```
psql -d coraltraits_development -c "\copy species FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/hexacorals/species.csv' delimiter ',' csv header"

psql -d coraltraits_development -c "\copy species FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/octocorals/species.csv' delimiter ',' csv header"

rake sunspot:solr:reindex
```
# LOCATIONS
```
psql -d coraltraits_development -c "\copy locations FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/hexacorals/locations.csv' delimiter ',' csv header"

psql -d coraltraits_development -c "\copy locations FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/octocorals/locations.csv' delimiter ',' csv header"

rake sunspot:solr:reindex
```
# STANDARDS
```
psql -d coraltraits_development -c "\copy standards FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/hexacorals/standards.csv' delimiter ',' csv header"

psql -d coraltraits_development -c "\copy standards FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/octocorals/standards.csv' delimiter ',' csv header"

rake sunspot:solr:reindex
```

# METHODS
```
psql -d coraltraits_development -c "\copy methodologies FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/hexacorals/methodologies.csv' delimiter ',' csv header"

psql -d coraltraits_development -c "\copy methodologies FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/octocorals/methodologies.csv' delimiter ',' csv header"

rake sunspot:solr:reindex
```
# RESOURCES
```
psql -d coraltraits_development -c "\copy resources FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/hexacorals/resources.csv' delimiter ',' csv header"

psql -d coraltraits_development -c "\copy resources FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/octocorals/resources.csv' delimiter ',' csv header"

rake sunspot:solr:reindex
```
# TRAITS
```
psql -d coraltraits_development -c "\copy traits FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/hexacorals/traits.csv' delimiter ',' csv header"

psql -d coraltraits_development -c "\copy traits FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/octocorals/traits.csv' delimiter ',' csv header"

rake sunspot:solr:reindex
```
# OBSERVATIONS
```
psql -d coraltraits_development -c "\copy observations FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/hexacorals/observations.csv' delimiter ',' csv header"

psql -d coraltraits_development -c "\copy observations FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/octocorals/observations.csv' delimiter ',' csv header"

rake sunspot:solr:reindex
```
# MEASUREMENTS
```
psql -d coraltraits_development -c "\copy measurements FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/hexacorals/measurements.csv' delimiter ',' csv header"

psql -d coraltraits_development -c "\copy measurements FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/octocorals/measurements.csv' delimiter ',' csv header"

rake sunspot:solr:reindex
```



### PSQL database interaction

```
psql postgres

\d locations

\copy locations FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/tables/locations.csv' DELIMITER ',' CSV HEADER

\copy locations FROM '/Users/jmadin/Dropbox/projects/rails_tutorial_sample_app_7th_ed/db/tables/locations.csv' DELIMITER ',' CSV HEADER


DELETE FROM standards where id > 0;



```

### Solr

```
bundle exec rake sunspot:solr:stop
bundle exec rake sunspot:solr:start
bundle exec rake sunspot:solr:reindex
```


###


This is the sample application for the
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](https://www.railstutorial.org/)
by [Michael Hartl](https://www.michaelhartl.com/).

## License

All source code in the [Ruby on Rails Tutorial](https://www.railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

## Getting started

To get started with the app, clone the repo and then install the needed gems. You can clone the repo as follows:

```
$ git clone https://github.com/learnenough/rails_tutorial_sample_app_7th_ed
$ cd rails_tutorial_sample_app_7th_ed/
```

To install the gems, you will need the same version of Bundler used to build the sample app, which you can find using the `tail` command as follows:

```
$ tail -n1 Gemfile.lock
   <version number>
```

Next, install the same version of the `bundler` gem and install the gems accordingly:

```
$ gem install bundler -v <version number>
$ bundle _<version number>_ config set --local without 'production'
$ bundle _<version number>_ install
```

Here you should replace `<version number>` with the actual version number. For example, if `<version number>` is `2.3.11`, then the commands should look like this:

```
$ gem install bundler -v 2.3.11
$ bundle _2.3.11_ config set --local without 'production'
$ bundle _2.3.11_ install
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you’ll be ready to seed the database with sample users and run the app in a local server:

```
$ rails db:seed
$ rails server
```

Follow the instructions in [Section 1.2.2 `rails server`](https://www.railstutorial.org/book#sec-rails_server) to view the app. You can then register a new user or log in as the sample administrative user with the email `example@railstutorial.org` and password `foobar`.

## Deploying

To deploy the sample app to production, you’ll need a Heroku account as discussed [Section 1.4 Deploying](https://www.railstutorial.org/book/beginning#sec-deploying).

The full production app includes several advanced features, including sending email with [SendGrid](https://sendgrid.com/) and storing uploaded images with [AWS S3](https://aws.amazon.com/s3/). As a result, deploying the full sample app can be rather challenging. The suggested method for testing a deployment is to use the branch for Chapter 10 (“Updating users”), which doesn’t require more advanced settings but still includes sample users.

To deploy this version of the app, you’ll need to create a new Heroku application, switch to the right branch, push up the source, run the migrations, and seed the database with sample users:

```
$ heroku create
$ git checkout updating-users
$ git push heroku updating-users:main
$ heroku run rails db:migrate
$ heroku run rails db:seed
```

Visiting the URL returned by the original `heroku create` should now show you the sample app running in production. As with the local version, you can then register a new user or log in as the sample administrative user with the email `example@railstutorial.org` and password `foobar`.

## Branches

The reference app repository includes a separate branch for each chapter in the tutorial (Chapters 3–14). To examine the code as it appears at the end of a particular chapter (with some slight variations, such as occasional exercise answers), simply check out the corresponding branch using `git checkout`:

```
$ git checkout <branch name>
```

A full list of branch names appears as follows (preceded the number of the corresponding chapter in the book):

```
 3. static-pages
 4. rails-flavored-ruby
 5. filling-in-layout
 6. modeling-users
 7. sign-up
 8. basic-login
 9. advanced-login
10. updating-users
11. account-activation
12. password-reset
13. user-microposts
14. following-users
```

For example, to check out the branch for Chapter 7, you would run this at the command line:

```
$ git checkout sign-up
```

## Help with the Rails Tutoiral

Experience shows that comparing code with the reference app is often helpful for debugging errors and tracking down discrepancies. For additional assistance with any issues in the tutorial, please consult the [Rails Tutorial Help page](https://www.railstutorial.org/help).

Suspected errors, typos, and bugs can be emailed to <support@learnenough.com>. All such reports are gratefully received, but please double-check with the [online version of the tutorial](https://www.railstutorial.org/book) and this reference app before submitting.
