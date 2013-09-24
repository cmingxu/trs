require 'rake/testtask'



task :default => :run

task :run do
  sh './bin/trs'
end


Rake::TestTask.new do |t|
  t.libs << "test"
  t.libs << "src"
  t.test_files = FileList['test/*test.rb']
  t.verbose = true
end
