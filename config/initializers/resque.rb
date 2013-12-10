require 'resque_scheduler'

Resque.redis = 'localhost:6379'

Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }

Resque.schedule = YAML.load_file(Rails.root.join('config', 'resque_schedule.yml'))

