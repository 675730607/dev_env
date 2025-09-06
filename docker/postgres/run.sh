#!/bin/bash


docker run -d \
	--name postgres \
    --rm \
	-e POSTGRES_PASSWORD=postgresql \
	-e PGDATA=/var/lib/postgresql/data/pgdata \
    -p 5432:5432 \
	-v ./:/var/lib/postgresql/data \
	postgres:16.10
