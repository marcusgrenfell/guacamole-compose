#!/bin/bash


GUACAMOLE_HOME_TEMPLATE="$GUACAMOLE_HOME"
GUACAMOLE_HOME="$HOME/.guacamole"
GUACAMOLE_EXT="$GUACAMOLE_HOME/extensions"
GUACAMOLE_LIB="$GUACAMOLE_HOME/lib"
GUACAMOLE_PROPERTIES="$GUACAMOLE_HOME/guacamole.properties"

start_guacamole() {

    # User-only writable CATALINA_BASE
    export CATALINA_BASE=$HOME/tomcat
    for dir in logs temp webapps work; do
        mkdir -p $CATALINA_BASE/$dir
    done
    cp -R /usr/local/tomcat/conf $CATALINA_BASE

    # Install webapp
    ln -sf /opt/guacamole/guacamole.war $CATALINA_BASE/webapps/${WEBAPP_CONTEXT:-guacamole}.war

    # Start tomcat
    cd /usr/local/tomcat
    exec catalina.sh run

}

MDSENHA=$( echo -n $PASSWORD| openssl md5  | cut -d " " -f 2)
sed -i "s/USERNAME/$USERNAME/g" /home/guacamole/.guacamole/user-mapping.xml
sed -i "s/PASSWORD/$MDSENHA/g" /home/guacamole/.guacamole/user-mapping.xml

start_guacamole

