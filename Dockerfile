FROM mysql:8.0.41 
# https://raw.githubusercontent.com/alibaba/nacos/develop/distribution/conf/mysql-schema.sql
ADD ./mysql-schema.sql /docker-entrypoint-initdb.d/nacos-mysql.sql
RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/nacos-mysql.sql
EXPOSE 3306
CMD ["mysqld", "--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci"]
