desc 'runs spinach'
task :spinach => :environment do
  ENV['RAILS_ENV']='test'
  cli = Spinach::Cli.new([])
  cli.init_reporter
  cli.run
end
