namespace :deploy do
  task :migrate do
    within release_path do
      execute :php, :artisan, "migrate", fetch(:laravel_artisan_flags)
    end
  end
end
