#!/usr/bin/env bash
docker run --name finansowanie_postgres -p 5432:5432 -e POSTGRES_USER=finansowanie -e POSTGRES_PASSWORD=finansowanie -e POSTGRES_DB=finansowanie -d postgres:11.2-alpine
