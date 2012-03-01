desc 'runs spinach and generates feature steps files when necessary'
task 'spinach:generate'  do
  ENV['RAILS_ENV']='test'
  Rake::Task["environment"].invoke
  cli = Spinach::Cli.new(['--generate'])
  cli.init_reporter
  cli.run
end

desc 'runs the whole spinach suite'
task :spinach do
  ENV['RAILS_ENV']='test'
  Rake::Task["environment"].invoke
  cli = Spinach::Cli.new([])
  cli.init_reporter
  cli.run
end
