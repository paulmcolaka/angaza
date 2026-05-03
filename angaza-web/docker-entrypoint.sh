#!/bin/sh
set -e
# Run pending Prisma migrations before starting the server
npx prisma migrate deploy
exec node server.js
