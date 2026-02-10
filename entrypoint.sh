#!/bin/sh
set -e

echo "⏳ Waiting for database..."

until nc -z db 5432; do
  sleep 1
done

echo "✅ Database is up!"

npx drizzle-kit migrate
npx drizzle-kit push

exec npm run start:dev
