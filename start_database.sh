#!/usr/bin/env bash
docker run --name finansowanie_postgres -p 5432:5432 -e POSTGRES_USER=finansowanie -e POSTGRES_PASSWORD=finansowanie -d postgres:9-alpine
