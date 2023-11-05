#!/bin/sh
poetry run pytest --cov -v --tb=native
ret=$?
if [ "$ret" = 5 ]; then
  echo "No tests collected.  Exiting with 0 (instead of 5)."
  exit 0
fi
exit "$ret"