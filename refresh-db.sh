docker exec -it ab0 bash -c "cd && psql -U postgres <<EOF
DROP DATABASE IF EXISTS featly;
CREATE DATABASE featly;
EOF"ß∑