workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RAILS_ENV'] || 'development'

plugin :tmp_restart

daemonize true
stdout_redirect 'log/puma_stdout.log', 'log/puma_stderr.log', true
pidfile 'tmp/pids/puma.pid'
