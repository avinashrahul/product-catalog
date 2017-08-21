set :application, 'product-catalog'
set :repo_url, 'git@github.com:avinashrahul/product-catalog.git' # Edit this to match your repository
set :branch, :master
set :deploy_to, '/var/www/product-catalog'
set :linked_files, %w{config/database.yml config/application.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 5

set :rvm_ruby_version, 'ruby-2.2.2'
set :rvm_type, :auto                     # Defaults to: :auto
set :rvm_roles, [:app, :web]

set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_threads,    [4, 16]
set :puma_workers,    0
set :puma_init_active_record, true  # Change to false when not using ActiveRecord


namespace :deploy do

  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      puts '** restarting'
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  before :starting,     :make_dirs
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end
