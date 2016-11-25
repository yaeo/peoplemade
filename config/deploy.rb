# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'pr-table'
set :repo_url, 'git@github.com:yaeo/pr-table.git'

# Default branch is :master
ask :branch, 'master'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/pr-table'

# シンボリックリンクをはるファイル。(※後述)
set :linked_files, fetch(:linked_files, []).push('config/secrets.yml')

# シンボリックリンクをはるフォルダ。(※後述)
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :default_env, {
	rbenv_root: "/usr/local/rbenv",
	path: "~/.rbenv/shims:~/.rbenv/bin:$PATH",
	AWS_REGION: ENV['AWS_REGION'],
	AWS_ACCESS_KEY_ID: ENV["AWS_ACCESS_KEY_ID"],
  AWS_SECRET_ACCESS_KEY: ENV["AWS_SECRET_ACCESS_KEY"],
  AWS_S3_BUCKET: ENV["AWS_S3_BUCKET"],
  AWS_S3_URL: ENV["AWS_S3_URL"]
}
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
set :sidekiq_queue, :carrierwave

# 保持するバージョンの個数(※後述)
set :keep_releases, 5

# rubyのバージョン（ruby -vコマンドで確認し、ご自身が使用しているバージョンを指定してください。）
set :rbenv_ruby, '2.3.1'

#出力するログのレベル。
set :log_level, :debug

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end
