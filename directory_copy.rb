
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

@custom_students = []

def input_cohort
months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  puts "Enter cohort month:"
  cohort_month = gets.chomp.downcase.to_sym

  cohort_month = :november if cohort_month.empty?

  until months.map(&:to_sym).include?(cohort_month)
    puts "Please enter a valid month"
    cohort_month = gets.chomp.downcase.to_sym
    return cohort_month = :november if cohort_month.empty?
  end
  cohort_month
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  cohort = input_cohort

# while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @custom_students << {name: name, cohort: cohort}
    puts "Now we have #{@custom_students.count} students"
    # get another name from the user
    puts "Please enter the names of the students"
    puts "To finish, just hit return three times"
    name = gets.chomp
    cohort = input_cohort
  end
  @custom_students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end


def print
  # count = 0
  # while count < students.length do 
  #   puts "#{count + 1}. #{students[count][:name]} (#{students[count][:cohort]} cohort), #{students[count][:country_of_birth]}, #{students[count][:height]}.".center(100)
  #   count = count + 1
  # end 
  
  # Each loop
  @custom_students.each.with_index(1) do |student, index|
  puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_by_cohort
  by_cohort = Hash.new { |key, value| key[value] = []}

  @custom_students.each do |student|
    by_cohort[student[:cohort]] << student
  end

  by_cohort.each_with_index do |(key, value), i|
    puts "#{i + 1}. #{key.to_s.upcase}"
    value.each { |x| puts "#{x[:name]} (#{x[:cohort]})" }
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

def print_footer
  puts "Overall, we have #{@custom_students.count} great students"
end

def less_than(students)
  students.each do |student|
    if student[:name].length < 12
      puts student 
    end 
  end 
end


input_students
print_header
print_by_cohort
print_footer
