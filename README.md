# Superset_Domino

For enabling Apache Superset in Domino

(warning) Works best for Postgres
(warning) Might freeze on large queries (see the Note in the next column at the bottom)

Note: if long running queries are timing out, consider setting the following Central Config keys:
com.cerebro.domino.computegrid.kubernetes.apps.nginx.readTimeout
com.cerebro.domino.computegrid.kubernetes.apps.nginx.connectTimeout
