lock '3.4.0'

set :application, 'my_app_name'
set :repo_url, 'https://liu7899@github.com/liu7899/cap.git'

ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :deploy_to, '/home/ljj/cap'
set :scm, :git

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :keep_releases, 15

namespace :deploy do

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'

end
