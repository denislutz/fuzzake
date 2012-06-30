namespace :fuzzake do
  desc "Task to give ask the user for a pattern name and then suggest the possible names. If the name is exactly fitting then the task will be executed."
  task :call do
    fuzzy_name = take_property_or_ask("task_pattern", "Write the full name or just a part of the task you want to call:") 
    fitting_tasks = [] 
    Rake::Task.tasks.each do |t|
      if t.name == fuzzy_name
        return Rake::Task[fuzzy_name].execute
      elsif t.name =~ Regexp.new(fuzzy_name)
        fitting_tasks << t.name
      end 
    end
    if fitting_tasks.empty?
      Rake::Task.tasks.each do |t|
        unless t.name =~ /default/ || t.name =~ /fuzzy/
          fitting_tasks << t.name
        end
      end
    end
    puts "There are the following tasks to execute:"
    fitting_tasks.each_with_index do |task,index|
      puts "#{index} for #{task}"
    end
    execution_task_index = ask("So what is the index of the task you want to call?")
    Rake::Task[fitting_tasks[execution_task_index.to_i]].execute
  end

  task :fuzzake, :arg1 do |t, args|
    Rake::Task["fuzzake:call"].execute("task_pattern" => args[:arg1])
  end

  def ask(message, default="")
    unless default.empty?
      message << " (type 'default' for #{default})"
    end
    print message
    answer = STDIN.gets.chomp
    if answer.strip.downcase == "default"
      default
    else
      answer
    end
  end

  def take_property_or_ask(property, question, default="")
    if ENV[property].nil?
      property_answer = ask(question, default)
      if property_answer == "default"
        property_answer = default
      end
    else
      property_answer = ENV[property]
    end
    property_answer
  end
end
