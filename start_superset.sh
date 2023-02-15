export SUPERSET_HOME=$DOMINO_WORKING_DIR
#export SUP_META_DB_URI=sqlite:///$DOMINO_WORKING_DIR/superset.db
#export ADDITIONAL_LAUNCH_OPTIONS="--debugger"
export ADDITIONAL_LAUNCH_OPTIONS=""
 
# export PYTHONPATH=$DOMINO_WORKING_DIR:$PYTHONPATH
 
# set up Superset if we haven't already
if [ ! -f $SUPERSET_HOME/.setup-complete ]; then
    echo "Running first time setup for Superset"
    superset fab create-admin --username admin --password superset --firstname Admin --lastname Superset --email superset+admin@example.com    echo "Initializing database"
    superset db upgrade
 
    # echo "Loading examples"
    # superset load_examples
 
    echo "Creating default roles and permissions"
    superset init
 
    touch $SUPERSET_HOME/.setup-completeelse
 
    # always upgrade the database, running any pending migrations
    superset db upgrade
    superset init
 
fi
 
echo "Starting up Superset"
(superset run --host "0.0.0.0" --port 8088 --with-threads --reload $ADDITIONAL_LAUNCH_OPTIONS 3>&1 1>&2 2>&3 | grep -v DEBUG\: |grep -v WARN\: | grep -v INFO\:) 3>&1 1>&2 2>&3
