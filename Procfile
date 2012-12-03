# Remember, that foreman will shutdown all processes if atleast one of them gets
# daemonized, because for detached process it thinks, like it was shutted down.
# Assuming, that in order to run application, all listed processes should be running,
# it will shutdown entire process list.
# Only foreground processes should be used.

solr: bundle exec rake sunspot:solr:run
server: rails s