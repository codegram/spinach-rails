desc 'runs the whole spinach suite'
task 'spinach:generate' => :environment do
  ENV['RAILS_ENV']='test'
  cli = Spinach::Cli.new(['--generate'])
  cli.init_reporter
  cli.run
end

desc 'runs spinach and generates feature steps files when necessary'
task :spinach => :environment do
  ENV['RAILS_ENV']='test'
  cli = Spinach::Cli.new([])
  cli.init_reporter
  cli.run
end
