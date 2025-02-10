for container in $(docker ps -q -f name=vote-app_postgres); do
  docker exec -it "$container" psql -U postgres -d postgres -c "DELETE FROM votes;"
done
