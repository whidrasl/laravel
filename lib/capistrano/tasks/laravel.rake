namespace :deploy do
	desc "Optimize Laravel Class Loader"
    task :optimize do
        on roles(:all) do
            within release_path do
                invoke "laravel:artisan", "view:clear"
                invoke "laravel:artisan", "cache:clear"
				invoke "laravel:artisan", "clear-compiled"
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
    after 'deploy:fpm_reload', 'deploy:optimize'
end
