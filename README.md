# Coral Trait database


### Start

```
https://github.com/learnenough/rails_tutorial_sample_app_7th_ed
```

### Heroku (test)

```
heroku login
git push heroku

heroku restart
heroku pg:reset DATABASE
heroku run rake db:migrate
```
https://devcenter.heroku.com/articles/heroku-postgres-import-export

```
pg_dump -Fc --no-acl --no-owner -h localhost -U deployer -d coraltraits_development -f coraltraits_development.dump

# Need to get link for dump from Dropbox.
heroku pg:backups:restore --app coraltraits --confirm coraltraits "https://www.dropbox.com/scl/fi/y3w2y8x6kkq49eoqeg2js/coraltraits_development.dump?rlkey=tyjx9x726w5vvsu1px0mpjrls&dl=0"



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
psql -d coraltraits_development -c "\copy species FROM '/Users/jmadin/Dropbox/projects/coraltraits/db/hexacorals/species.csv' delimiter ',' csv header"

psql -d coraltraits_development -c "\copy species FROM '/Users/jmadin/Dropbox/projects/coraltraits/db/octocorals/species.csv' delimiter ',' csv header"

# LOCATIONS
psql -d coraltraits_development -c "\copy locations FROM '/Users/jmadin/Dropbox/projects/coraltraits/db/hexacorals/locations.csv' delimiter ',' csv header"

psql -d coraltraits_development -c "\copy locations FROM '/Users/jmadin/Dropbox/projects/coraltraits/db/octocorals/locations.csv' delimiter ',' csv header"

psql -d coraltraits_development -c "\copy locations FROM '/Users/jmadin/Dropbox/projects/coraltraits/db/octocorals/locations_301.csv' delimiter ',' csv header"

# STANDARDS
psql -d coraltraits_development -c "\copy standards FROM '/Users/jmadin/Dropbox/projects/coraltraits/db/hexacorals/standards.csv' delimiter ',' csv header"

psql -d coraltraits_development -c "\copy standards FROM '/Users/jmadin/Dropbox/projects/coraltraits/db/octocorals/standards.csv' delimiter ',' csv header"

# METHODS
psql -d coraltraits_development -c "\copy methodologies FROM '/Users/jmadin/Dropbox/projects/coraltraits/db/hexacorals/methodologies.csv' delimiter ',' csv header"

psql -d coraltraits_development -c "\copy methodologies FROM '/Users/jmadin/Dropbox/projects/coraltraits/db/octocorals/methodologies.csv' delimiter ',' csv header"

# RESOURCES
psql -d coraltraits_development -c "\copy resources FROM '/Users/jmadin/Dropbox/projects/coraltraits/db/hexacorals/resources.csv' delimiter ',' csv header"

psql -d coraltraits_development -c "\copy resources FROM '/Users/jmadin/Dropbox/projects/coraltraits/db/octocorals/resources.csv' delimiter ',' csv header"

# TRAITS
psql -d coraltraits_development -c "\copy traits FROM '/Users/jmadin/Dropbox/projects/coraltraits/db/hexacorals/traits.csv' delimiter ',' csv header"

psql -d coraltraits_development -c "\copy traits FROM '/Users/jmadin/Dropbox/projects/coraltraits/db/octocorals/traits.csv' delimiter ',' csv header"

# OBSERVATIONS
psql -d coraltraits_development -c "\copy observations FROM '/Users/jmadin/Dropbox/projects/coraltraits/db/hexacorals/observations.csv' delimiter ',' csv header"

psql -d coraltraits_development -c "\copy observations FROM '/Users/jmadin/Dropbox/projects/coraltraits/db/octocorals/observations.csv' delimiter ',' csv header"

# MEASUREMENTS
psql -d coraltraits_development -c "\copy measurements FROM '/Users/jmadin/Dropbox/projects/coraltraits/db/hexacorals/measurements.csv' delimiter ',' csv header"

psql -d coraltraits_development -c "\copy measurements FROM '/Users/jmadin/Dropbox/projects/coraltraits/db/octocorals/measurements.csv' delimiter ',' csv header"

rake sunspot:solr:reindex

###


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
