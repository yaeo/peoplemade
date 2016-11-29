# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '52.199.137.129', user: 'yaeo', roles: %w{app db web}

#デプロイするサーバにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/story_product_rsa'

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "/var/www/pr-table/current/Gemfile"
end
