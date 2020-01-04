
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Coreleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november},
]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
# create an empty array
  students = []
  name = gets.chomp
# while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students <<{name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_students_by_letter(students, letter)
  selected_students = []

    students.each do |student|
      puts student[:name][0]
      if student[:name][0] === letter.downcase
        selected_students.push(student)
      end
    end

  print(selected_students)
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def less_than(students)
  students.each do |student|
    if student[:name].length < 12
      puts student 
    end 
  end 
end


students = input_students
print_header
less_than(students)
print_footer(students)
