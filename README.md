# Build your own MSSQL image with init data

## What is Microsoft SQL Server (MSSQL)?

Microsoft SQL Server is a relational database management system (RDBMS). Applications and tools connect to a SQL Server instance or database, and communicate using Transact-SQL (T-SQL).

For more information and related downloads for MSSQL Server and other MSSQL products, please visit https://learn.microsoft.com/en-us/sql/sql-server/.

## Create your init data

Update [setup.sql](https://github.com/jasonlws/docker-database-mssql/blob/master/setup.sql) file

```sql
CREATE DATABASE jasonlws;
GO

USE jasonlws;
```

## How to build

Build an image from a Dockerfile

```bash
docker build -t jasonlws/mssql:2019-latest --build-arg IMAGE_TAG=2019-latest --build-arg SETUP_SQL_PATH=./init-data --no-cache .
```

## How to run

Create and run a new container from an image

### docker run

```bash
docker run --name jasonlws-mssql -e SA_PASSWORD=P@ssw0rd -e ACCEPT_EULA=Y -p 1433:1433 -d jasonlws/mssql:2019-latest
```

### docker-compose

```bash
docker-compose -f ./docker-compose/docker-compose.yml --env-file ./docker-compose/.env up
```

## References

[DockerHub MSSQL Image](https://hub.docker.com/_/microsoft-mssql-server)

## License

MIT - a permissive free software license originating at the Massachusetts Institute of Technology (MIT), it puts only very limited restriction on reuse and has, therefore, an excellent license compatibility. It permits reuse within proprietary software provided that all copies of the licensed software include a copy of the MIT License terms and the copyright notice.

Check the [LICENSE file](https://github.com/jasonlws/docker-database-mssql/blob/master/LICENSE) for more details.