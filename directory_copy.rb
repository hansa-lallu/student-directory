@students = [] 

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end 

def interactive_menu
  loop do
   print_menu
   process(gets.chomp)
  end 
end 

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else 
    puts "I don't know what you meant, try again"
  end 
end 

def add_student(name, cohort = :november)
  @students << {name: name, cohort: cohort.to_sym}
end 

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
# while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student(name)
    print_student_count
    # get another name from the user  
    name = STDIN.gets.chomp
  end
end

def load_file(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
   add_student(name, cohort)
  end 
  file.close
end 

def show_students
  print_header
  print_students_list
  print_student_count
end 

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_student_count
  puts "Overall, we have #{@students.count} great student#{@students.count > 1 ? "s" : null}"
end  

def save_students
  # open the file for writing
  file = File.open("students.csv" , "w")
  # interate over the array of students 
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end 
  file.close 
end 

def load_students
  filename = ARGV.first # first argument from the command line
    
  if filename.nil? # get out of the method if it isn't given
    filename = 'students.csv'
  end

  if File.exists?(filename) # if it exists
    load_file(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

load_students
interactive_menu
