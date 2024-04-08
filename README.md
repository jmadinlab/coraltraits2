# Coral Trait database


### Start

```
https://github.com/learnenough/rails_tutorial_sample_app_7th_ed
```

### Heroku

```
git push heroku main:main

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
