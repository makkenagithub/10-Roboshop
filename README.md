# 10-Roboshop

1. SQL DB - a structural db, contains rows and tabels - example are mysql, mssql, oracle, postgreSQL, Maria etc
2. NoSQL DB - a non-structural db, contains documents and collections - Mongo db (big projects use mongodb - like some bigdata projects)
3. Redis - is cache server or cache DB.
4. RabbitMQ - is a messaging queue (asynchronous communication) like kafka, activeMQ


How Application connects to DB?
1. Open DB connection
2. run query and get the results
3. close the connection.

As the application connections to DB increases, DB can be locked and application can stuck. For this we have cahce DB Redis. Its very fast.

Redis - is cache server or cache DB. 

When the first time application connects to DB, it connects to actual DB and fetch the results. And stores the result in Redis DB. Next time when the applicatuon tries to connect to DB, then application initially try to fetch the result from cache redis DB, if data not available in redis, then only application makes new connection to actual DB. Like this data fecth from DB gets faster.



