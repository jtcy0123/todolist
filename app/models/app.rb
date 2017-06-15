class App
  def initialize(input)
    @input = input
  end

  def run
    case @input[0]
    when "create"  #to create a new list eg. ruby todo.rb --create "Shopping"
      List.create_list(@input)
    when "assign"  #to assign task(s) to a list eg. ruby todo.rb --assign 1,2,4 "Shopping"
      Task.assign_to_list(@input)
    when "add"  #to add a new task eg. ruby todo.rb --add "walk the dog" "Shopping"
      Task.add_task(@input)
    when "list"
      if @input[1] == "tasks"  #list out all the tasks eg. ruby todo.rb --list tasks
        Task.list_task
      elsif @input[1] == "lists"  #list out all the to-do lists eg. ruby todo.rb --list lists
        List.show_lists
      elsif @input[1] != nil
        List.list_tasks(@input)  #list out all tasks from a list eg. ruby todo.rb --list "Shopping"

      else
        puts "Invalid input!"
      end
    when "update"
      Task.update_task(@input)  #to update a task description or status eg. ruby todo.rb --update 2 "done"
    when "remove"
      Task.remove_task(@input)  #to remove a task eg. ruby todo.rb --remove 2
    else
      puts "Invalid input!"
    end
  end
end
