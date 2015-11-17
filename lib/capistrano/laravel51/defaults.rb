set :laravel_roles, :all
set :laravel_artisan_flags, '--env=production'
set :laravel_server_user, "deploy"

set :linked_dirs, [fetch(:linked_dirs), 'vendor', 'storage/app', 'storage/logs', 'storage/framework/cache', 'storage/framework/sessions', 'storage/framework/views', 'bootstrap/cache']

set :file_permissions_paths, fetch(:linked_dirs)
set :file_permissions_users, [fetch(:laravel_server_user)]
