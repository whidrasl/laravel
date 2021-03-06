namespace :deploy do
    desc "Optimize Laravel Class Loader"
    task :optimize do
        on roles(:all) do
            within release_path do
                execute :php, :artisan, "clear-compiled", fetch(:laravel_artisan_flags)
                execute :php, :artisan, "optimize", fetch(:laravel_artisan_flags)
                execute :php, :artisan, "config:cache", fetch(:laravel_artisan_flags)
                execute :php, :artisan, "route:cache", fetch(:laravel_artisan_flags)
            end
        end
    end
    
    namespace :optimize do
        desc "Clear global cache"
        task :cache do
            on roles(:all) do
                within release_path do
                    execute :php, :artisan, "view:clear", fetch(:laravel_artisan_flags)
                    execute :php, :artisan, "cache:clear", fetch(:laravel_artisan_flags)
                end
            end
        end
    end
    
    desc 'Reload php-fpm'
    task :fpm_reload do
        on roles(:all) do
            execute 'sudo /sbin/service php-fpm reload'
        end
    end

    after :published, 'composer:install'
    after :updated, 'deploy:set_permissions:chmod'
    after 'deploy:symlink:release', 'deploy:fpm_reload'
    after :updated, :optimize
    after :fpm_reload, 'deploy:optimize:cache'
end
