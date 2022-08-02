# [mp3-spring-angular](https://reactjs.org/) &middot; [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/facebook/react/blob/main/LICENSE) [![npm version](https://img.shields.io/npm/v/react.svg?style=flat)](https://www.npmjs.com/package/react) [![CircleCI Status](https://circleci.com/gh/facebook/react.svg?style=shield&circle-token=:circle-token)](https://circleci.com/gh/facebook/react) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://reactjs.org/docs/how-to-contribute.html#your-first-pull-request)

This mp3-spring-angular app for my final exam in my fuckkup university.

## Installation Frontend

Angular has been designed for gradual adoption from the start, and **you can use as little or as much Angular as you need**:

```npm
npm install
```

After project install source folder u can start it:

```jsx
ng serve
```

## Deploy Backend

First u need an AWS account - this bullshit app suckk a trash.

You can find the AWS documentation [on the website](https://aws.amazon.com/vi/).  

Creating an account for using [S3 Storage Service](https://s3.console.aws.amazon.com/s3/home?region=ap-southeast-1). Try to config it and then u gonna fuckkup too.

Change application.properties:

```java
server.port={port}
spring.datasource.url= jdbc:mysql://127.0.0.1:3306/{your_database_name}?useSSL=false&allowPublicKeyRetrieval=true&sessionVariables=sql_mode='NO_ENGINE_SUBSTITUTION'&jdbcCompliantTruncation=false
spring.datasource.username= {your_db_username}
spring.datasource.password= {your_db_password}

spring.jpa.properties.hibernate.dialect= org.hibernate.dialect.MySQL5InnoDBDialect
spring.jpa.hibernate.ddl-auto=update

aws.access.key.id = {your_aws_access_key_id}
aws.access.key.secret = {your_aws_access_key_secret}
aws.region = {your_aws_region}
aws.s3.audio.bucket = {your_aws_bucket_name}
aws.s3.image.bucket = {your_aws_bucket_name}

# App Propertiess
bezkoder.app.jwtSecret= bezKoderSecretKey 
bezkoder.app.jwtExpirationMs= 86400000

spring.servlet.multipart.max-file-size=10MB
spring.servlet.multipart.max-request-size=10MB

paypal.mode=sandbox
paypal.client.id=AViMt95oW_Ef1jFjybHsRhU0a1jA0MnDo91w963ygkeNwaDTQtbd_2gXPV2QV4M-9PDTFSeUVozBB_EK
paypal.client.secret=EMrCuvn7vNqI0vdPk1teuVhTxqXG88zl0cCWw2gIsvT6bKVCo0xApR5M-QidYVmmXKqLBK57FnXoRL_i
```

### Import database

```python
use thebeats;
{paste data in datadump.sql here}
```

### Good First Issues

To help you get your feet wet and get you familiar with our contribution process, we have a list of [good first issues](https://stackoverflow.com/) that contain bugs that have a relatively limited scope. This is a great place to get started.

### License

App is [MIT licensed](./LICENSE).

