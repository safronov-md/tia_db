FROM postgres:latest

COPY init.sh /docker-entrypoint-initdb.d/init.sh
COPY db_init.sql /docker-entrypoint-initdb.d/1_init.sql
COPY mock_insert.sql /docker-entrypoint-initdb.d/2_mock_insert.sql

RUN chmod +x /docker-entrypoint-initdb.d/init.sh

COPY custom_entrypoint.sh /usr/local/bin/custom_entrypoint.sh
RUN chmod +x /usr/local/bin/custom_entrypoint.sh

ENTRYPOINT ["/usr/local/bin/custom_entrypoint.sh"]

CMD ["postgres"]
