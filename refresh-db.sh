docker exec -it 02ed bash -c "cd && psql -U postgres <<EOF
DROP DATABASE IF EXISTS featly;
CREATE DATABASE featly;
EOF"