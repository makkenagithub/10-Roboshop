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


Initially we do project manually, we create instances using terrafrom and then install the applications in ec2 instances manually by using commands adn following documentation. Once we create ec2 instances using 02-infra-servers, then login to each instance using public ip, then we need to do applications installations sequentialliny like, first db, then app tier, then front end. The sequence as follows

1. mongodb - port 27017
2. redis - port 6379
3. mysql - port 3306
4. rabbitmq - port 5672
5. catalogue - Its nodejs application, port 8080. It is to load certain products in the site.
6. user - nodejs 8080 port
7. cart - nodejs 8080
8. shipping - java - maven - 8080 port
9. payment - python - pip - 8080 port
10. frontend - web - nginx
11. dispatch - golang



by default DBs works on its local hosts only. It does not allow any other IPs to connect to DB servers. To make other IPs to connect to DBs, we need to modify its config file with the IPs which we need to connect from. For eg:  vim /etc/mongod.conf

Application can run on any programming language.
Any programming language contails one build file, one build tool. Build file contains dependencies.  (for nondejs build file is package.json and build tool is npm) Build tool download/installs the dependencies (node_modules is created for nodejs)

Java uses build tool mavon. Biuld file is pom.xml. Build command is "mvn package" or "mvn clean package". When we run mvn package command it creates a jar file in target/application.jar file. This jar file is the compiled bytecode. java is heavy and consumes more memory compared to other languages. Java is speed compared to others.
```
mvn clean package
```
means it cleans the previous build if any exists and builds the new package.

cat pom.xml and see it contains groupid, artifcatid, version. Java Build file contains dependencies mentioned in groupid, artifact-id and version.

Eg: Java can contains groupID (com.roboshop), artifactID (shipping), version (1.0.5)
Java needs to be compiled, it gives bytecode (jar file). We need to run this bytecode. To run the bytecode we need JRE
JDK - we need this at the time of development
JRE - we need this at the time of running.
JRE is subset of JDK. 

Python: buuld file is requirements.txt and build tool is pip. Here no need of compilation, similar to nodejs. Only java needs compilation.

golang: when we run golang build files, it created a buildfile named "dispatch" in this project.

Every application tier have a health check url
for catalogue app,  command is "curl http://localhost:8080/health" , similarly for other app tiers.

In some apps we run commands "systemctl daemon-reload" and in some apps we run "systemctl resatrt <service-name>" , why? 
I observe, the apps which are connecting to DB we use "systemctl daemon-reload" eg: backedn applications. 
And the apps which are not connecting to DB we use "systemctl restart <service-name>" . eg: frontend and DBs
"systemctl restart nginx"
"systemctl restart mysqld"





