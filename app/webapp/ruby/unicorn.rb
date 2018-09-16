worker_processes 3
preload_app true
timeout 20
stderr_path '/home/isucon/torb/webapp/ruby/unicorn_err.log'
stdout_path '/home/isucon/torb/webapp/ruby/unicorn.log'

#listen '/home/isucon/torb/webapp/ruby/unicorn.sock'
listen 8080
