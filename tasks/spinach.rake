task :spinach_env do
  ENV['RAILS_ENV'] = 'test'
end

desc 'runs spinach and generates feature steps files when necessary'
task 'spinach:generate' => :spinach_env  do
  system 'spinach --generate'
end

desc 'runs the whole spinach suite'
task :spinach => :spinach_env do
  system 'spinach'
end
