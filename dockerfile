RUN pip install apache-superset
 
RUN mkdir -p /var/opt/workspaces/superset &&
chmod 755 /var/opt/workspaces/superset
 
#use the correct path to your start_superset.sh, e.g. https://raw.githubusercontent.com/ddl-ben-wolstenholme/Superset_Domino/main/start_superset.sh
ADD https://raw.githubusercontent.com/ddl-ben-wolstenholme/Superset_Domino/main/start_superset.sh /var/opt/workspaces/superset/start
 
RUN chmod 755 /var/opt/workspaces/superset/start
