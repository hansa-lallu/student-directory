
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, country_of_birth: "Japan", height: 165},
  {name: "Darth Vader", cohort: :november, country_of_birth: "New Zealand", height: 175},
  {name: "Nurse Ratched", cohort: :november, country_of_birth: "Australia", height: 168},
  {name: "Michael Coreleone", cohort: :november, country_of_birth: "Hawaii", height: 185},
  {name: "Alex DeLarge", cohort: :november, country_of_birth: "UK", height: 178},
  {name: "The Wicked Witch of the West", cohort: :november, country_of_birth: "UK", height: 163},
  {name: "Terminator", cohort: :november, country_of_birth: "UK", height: 169},
  {name: "Freddy Krueger", cohort: :november, country_of_birth: "Greece", height: 165},
  {name: "The Joker", cohort: :november, country_of_birth: "Iceland", height: 178},
  {name: "Joffrey Baratheon", cohort: :november, country_of_birth: "Turkey", height: 181},
  {name: "Norman Bates", cohort: :november, country_of_birth: "Japan", height: 183},
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
  count = 0
  while count < students.length do 
    puts "#{count + 1}. #{students[count][:name]} (#{students[count][:cohort]} cohort), #{students[count][:country_of_birth]}, #{students[count][:height]}.".center(100)
    count = count + 1
  end 
  # Each loop
  # students.each.with_index(1) do |student, index|
  # puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  # end
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



print_header
print(students)
print_footer(students)
