set :laravel_roles, :all
set :laravel_artisan_flags, '--env=production'
set :laravel_server_user, "deploy"

set :linked_dirs, ['vendor', 'storage', 'node_modules']

set :file_permissions_paths, fetch(:linked_dirs)
set :file_permissions_users, [fetch(:laravel_server_user)]
