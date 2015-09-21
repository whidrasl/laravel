namespace :deploy do
    task :clear_view do
        on roles(:all) do
            within release_path do
                invoke "laravel:artisan", "view:clear"
            end
        end
    end
    task :clear_cache do
        on roles(:all) do
            within release_path do
                invoke "laravel:artisan", "cache:clear"
            end
        end
    end
    task :clear_compiled do
        on roles(:all) do
            within release_path do
                invoke "laravel:artisan", "clear-compiled"
            end
        end
    end   
    task :optimize do
        on roles(:all) do
            within release_path do
                invoke "laravel:artisan", "optimize"
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
    after 'deploy:fpm_reload', 'deploy:clear_view'
    after 'deploy:clear_view', 'deploy:clear_cache'
    after 'deploy:clear_cache', 'deploy:clear_compiled'
     after 'deploy:clear_compiled', 'deploy:optimize'
end
