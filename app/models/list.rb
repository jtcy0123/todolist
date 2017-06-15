class List < ActiveRecord::Base

  def self.create_list(list_title)
    List.create(title: list_title[1])
    puts "New list created!"
    p list_title[3]
  end

  def self.show_lists
    print "No.".ljust(4) + "Title\n"
    print "===".ljust(4) + "=====\n"
    List.all.each_with_index do |list,index|
      print "#{index+1}".ljust(4) + "#{list.title}\n"
    end
  end

  def self.list_tasks(list_title)
    list = List.find_by(title: list_title[1])
    tasks = Task.where(list_id: list.id)
    puts "This is your #{list.title} list!"
    print "No.".ljust(4) + "Description".ljust(20) + "Status\n"
    print "===".ljust(4) + "===========".ljust(20) + "======\n"
    tasks.each_with_index do |task,index|
      print "#{index+1}".ljust(4) + "#{task.description}".ljust(20) + "#{task.status}\n"
    end
  end

end