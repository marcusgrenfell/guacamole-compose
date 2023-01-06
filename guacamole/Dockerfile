FROM guacamole/guacamole:latest
COPY start.sh /opt/guacamole/bin/start.sh
COPY guacamole.properties /home/guacamole/.guacamole/guacamole.properties
COPY user-mappings.xml /home/guacamole/.guacamole/user-mapping.xml
USER root
RUN chmod +x /opt/guacamole/bin/start.sh
RUN chown -R guacamole /home/guacamole/.guacamole
USER guacamole
