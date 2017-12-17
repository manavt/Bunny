namespace :hello do
  desc "TODO"
  task "p1" do
    puts "Hello I am here"
  end

  desc "TODO"
  task :my_task2 => :environment do
  end
end
