class Task < ActiveRecord::Base

  def self.assign_to_list(details)
    numbers = details[1].split(",")
    list = List.find_by(title: details.last)
    numbers.each do |num|
      task = Task.find_by(number: num)
      task.update(list_id: list.id)
    end
    puts "Added tasks to list!"
  end

  def self.add_task(task_details)
    list = List.find_by(title: task_details[2])
    Task.create(number: Task.all.count+1, description: task_details[1], status: "undone", list_id: list.id)
    puts "Task saved!"
  end

  def self.list_task
    list = List.all
    print "No.".ljust(4) + "Description".ljust(20) + "Status".ljust(8) + "Belongs To\n"
    print "===".ljust(4) + "===========".ljust(20) + "======".ljust(8) + "==========\n"
    Task.all.each do |task|
      print "#{task.number}".ljust(4) + "#{task.description}".ljust(20) + "#{task.status}".ljust(8) + list.find_by(id: task.list_id).title + "\n"
    end
  end

  def self.update_task(task_details)
    task = Task.find_by(number: task_details[1])
    if task != nil
      if task_details.length == 4
        task.update(description: task_details[2], status: task_details[3])
        puts "Task updated!"
      elsif task_details.length == 3
        if task_details[2].downcase == "done" || task_details[2].downcase == "undone"
          task.update(status: task_details[2])
        else
          task.update(description: task_details[2])
        end
      end
    else
      puts "Task number #{task_details[1]} is not found. Are you sure that this is the right task number?"
    end
  end

  def self.remove_task(task_num)
    task = Task.find_by(number: task_num[1])
    if task != nil
      task.delete
      puts "Task removed!"
      Task.all.each_with_index do |task,index|
        task.update(number: index+1)
      end
    else
      puts "Task number #{task_num[1]} is not found. Are you sure that this is the right task number?"
    end
  end

end
