require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'
require 'mina/puma'
require 'mina/whenever'
require 'mina/data_sync'
require 'mina_sidekiq/tasks'

# require 'mina/rollbar'

# set :rollbar_access_token, 'd2edc3f18ee448e288e1ba31d69655a2'
# require 'mina_sidekiq/tasks'

# require 'mina/tail'
# require 'mina/rollbar'

# require 'mina/puma'
# require 'mina/tail'
# require 'mina/rollbar'

# require 'mina/rbenv'  # for rbenv support. (https://rbenv.org)
# require 'mina/rvm'    # for rvm support. (https://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

# set :rollbar_access_token, '520df7f2a4bc4148ace261ac10a2ae2a'

set :keep_releases, 20
set :application_name, 'the-menu'
set :domain, 'the-menu.ru'
set :port, 12622
set :user, :deploy
set :deploy_to, '/var/www/the-menu'
set :repository, 'git@github.com:benone/the_menu.git'
set :branch, 'master'

set :forward_agent, true     # SSH forward_agent.

set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/secrets.yml')


# set :shared_dirs, fetch(:shared_dirs, []).push('tmp/pids').push('tmp/sockets')
set :shared_dirs, fetch(:shared_dirs, []).push('log', 'tmp/pids', 'tmp/sockets', 'public/data')

# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  invoke :'rbenv:load'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  # command %{rbenv install 2.3.0}
end

desc "Deploys the current version to the server."
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    invoke :'rbenv:load'

    # invoke :'sidekiq:quiet'

    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'deploy:cleanup'
    invoke :'rails:assets_precompile'


    on :launch do
      invoke :'whenever:update'
      # invoke :'puma:restart'
      invoke :'puma:stop'
      invoke :'puma:start'
      # invoke :'rollbar:notify'
      
      # invoke :'puma:phased_restart'
      # invoke :'rollbar:notify'
    end
  end

end
