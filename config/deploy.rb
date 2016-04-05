# config valid only for Capistrano 3.1
lock '3.4.0'

set :application, 'bloomers'
set :repo_url, 'git@github.com:pallan/bloomers.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp vendor/bundle public/system public/uploads}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
