namespace :deploy do
	desc "Optimize Laravel Class Loader"
    task :optimize do
        on roles(:all) do
            within release_path do
				invoke "laravel:artisan", "cache:clear"
				invoke "laravel:artisan", "clear-compiled"
				invoke "laravel:artisan", "optimize"
            end
        end
    end

	after :published, "composer:install"
	after :updated, "deploy:optimize"
  	after :updated, 'deploy:set_permissions:chmod'
end
