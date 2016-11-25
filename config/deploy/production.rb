server '52.68.202.49', user: 'yaeo', roles: %w{app db web}

set :ssh_options, keys: '~/.ssh/ec2_key_rsa'
