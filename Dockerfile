FROM mysql/mysql-server:5.6

RUN echo "!includedir /etc/my.cnf.d" >> /etc/my.cnf;

RUN echo "[mysqld]" >> /etc/my.cnf.d/mysqld.cnf;
RUN echo "explicit_defaults_for_timestamp=1" >> /etc/my.cnf.d/mysqld.cnf;
RUN echo "sql-mode='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION'" >> /etc/my.cnf.d/mysqld.cnf; 
RUN echo "character-set-server=utf8"    >> /etc/my.cnf.d/mysqld.cnf;
RUN echo "bind-address=0.0.0.0"    >> /etc/my.cnf.d/mysqld.cnf;

ENV "MYSQL_ROOT_HOST" "%"
ENV "MYSQL_ROOT_PASSWORD" "_"

RUN echo "SET GLOBAL time_zone = 'utc';" >> "/docker-entrypoint-initdb.d/init-timezone.sql"

ENTRYPOINT ["/entrypoint.sh"]
HEALTHCHECK CMD /healthcheck.sh
EXPOSE 3306
CMD ["mysqld"]
