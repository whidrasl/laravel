namespace :deploy do
  task :migrate do
  	on roles(:all) do
	    within release_path do
	      execute :php, :artisan, "migrate", "--database=migrate"
	    end
	end
  end
end