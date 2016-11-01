# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'blog'
set :repo_url, 'git@codebase.qburst.com:falgun/my-rails-app.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
set :scm, :git
server "qb-clt-1015", roles: [:app, :web, :db], :primary => true
set :deploy_to, '/home/qburst/Deploy'
set :branch, "master"
set :deploy_via, :remote_cache
set :user, 'qburst'
set :use_sudo, true
set :sudo, "sudo -u qburst"
set :stage, "development"
set :rails_env, :development
set :passenger_roles, :app
set :local_repository, "/home/qburst/Git_Repo/blog"
set :ssh_options, {
   user: 'qburst', # overrides user setting above
   forward_agent: false,
   auth_methods: %w(password),
   password: 'qburst'
 }
set :rvm_ruby_version, '1.9.3-p448'
set :default_env, { rvm_bin_path: '~/.rvm/bin' }
SSHKit.config.command_map[:rake] = "#{fetch(:default_env)[:rvm_bin_path]}/rvm ruby-#{fetch(:rvm_ruby_version)} do bundle exec rake"


# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
set :puma_user, fetch(:user)
set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_default_control_app, "unix://#{shared_path}/tmp/sockets/pumactl.sock"
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'development'))
set :puma_threads, [0, 16]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, false
set :puma_preload_app, false
set :puma_plugins, []  #accept array of plugins
set :nginx_use_ssl, false
#set :rbenv_path, '/home/deploy/.rbenv/'
set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }

