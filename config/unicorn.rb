# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/var/www/plataform"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/var/www/plataform/tmp/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/var/www/plataform/log/unicorn.log"
stdout_path "/var/www/plataform/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.plataform.sock"
listen "/tmp/unicorn.plataform.sock"
# Number of processes

worker_processes 4

# Time-out
timeout 30