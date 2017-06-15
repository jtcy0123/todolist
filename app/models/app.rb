class App
  def initialize(input)
    @input = input
  end

  def run
    case @input[0]
    when "create"
      List.create_list(@input)
    when "assign"
      Task.assign_to_list(@input)
    when "add"
      Task.add_task(@input)
    when "list"
      if @input[1] == "tasks"
        Task.list_task
      elsif @input[1] == "lists"
        List.show_lists
      elsif @input[1] != nil
        List.list_tasks(@input)
      else
        puts "Invalid input!"
      end
    when "update"
      Task.update_task(@input)
    when "remove"
      Task.remove_task(@input)
    else
      puts "Invalid input!"
    end
  end
end
