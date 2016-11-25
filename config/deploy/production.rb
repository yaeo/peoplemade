server '52.68.202.49', user: 'yaeo', roles: %w{app db web}

set :ssh_options, keys: '~.ssh/story_product.pem'
