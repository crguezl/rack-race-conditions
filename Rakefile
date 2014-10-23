desc "run the server"
task :default do
  sh <<-"EOS"
  #rvm use jruby-1.7.3 &&
  #ruby -v &&
  rackup -s puma configapp.ru 
  EOS
end

desc "run the client"
task :client do
  pids = []
  (0...100).each do
    pids << fork do
      sh %q{curl -v 'http://localhost:9292' >> salida 2>> logs}
    end
  end
  puts pids
end

desc "remove output and logs"
task :clean do
  sh "rm -f salida logs"
end
