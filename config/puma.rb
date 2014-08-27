workers 2
threads 1,4

preload_app!

rackup      DefaultRackup
bind    "unix:///#{Dir.pwd}/tmp/puma.sock"


on_worker_boot do
  # worker specific setup
  ActiveSupport.on_load(:active_record) do
    config = ActiveRecord::Base.configurations[Rails.env] ||
                Rails.application.config.database_configuration[Rails.env]
    config['pool'] = ENV['MAX_THREADS'] || 16
    ActiveRecord::Base.establish_connection(config)
  end
end
