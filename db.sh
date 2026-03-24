#!/usr/bin/env bash
# One-line docker run avoids broken line continuations when the file has CRLF
# (Windows): bash would run stray "d" from "-d" as its own command.
docker run -d --name my-better-auth -e POSTGRES_USER=better-auth -e POSTGRES_PASSWORD=papa2pa -e POSTGRES_DB=better-auth -p 5432:5432 -v schedula-better-auth-pgdata:/var/lib/postgresql/data postgres:16


# open shell: docker exec -it my-better-auth bash
# then: PGPASSWORD=papa2pa psql -h 127.0.0.1 -U better-auth -d better-auth
# or one-liner: docker exec -it my-better-auth env PGPASSWORD=papa2pa psql -h 127.0.0.1 -U better-auth -d better-auth
#
# FATAL: role "better-auth" does not exist — data was initialized without that user
# (first boot only). Remove container + volume, then run this script again:
#   docker rm -f my-better-auth && docker volume rm schedula-better-auth-pgdata
#
# Old generic volume name (if you used it before): docker volume rm pgdata

# DATABASE_URL (host machine → published port 5432):
# DATABASE_URL=postgresql://better-auth:papa2pa@localhost:5432/better-auth
