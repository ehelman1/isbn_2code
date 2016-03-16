def valid_isbn?(input_string)
   remove_invalid_characters(input_string)
   correct_length?(input_string)
end

def remove_invalid_characters(input_string)
   input_string.delete!(" ")
   input_string.delete!("-")
end

def correct_length?(input_string)
   if input_string.length == 10 
       true
   elsif input_string.length == 13 && valid_isbn13?(input_string)
       true
   else
       false
   end
end

def valid_isbn13?(input_string)
   array_of_strings = convert_string_to_array(input_string)
   array_of_intergers = multiply_array(array_of_strings)
   sum_of_intergers = sum_of_items(array_of_intergers)
   check_number = subtraction(sum_of_intergers)
   
	if check_number == input_string[-1].to_i
		true
	else
		false
	end
   
end

def convert_string_to_array(string)
   string.split("")
end

def multiply_array(input_array)
   array = []
   input_array.each_with_index do |value,index|
       value = value.to_i
       if index % 2 == 0
           array << value * 1 
       else 
           array << value * 3
       end
   end
   array
end

def sum_of_items(array_of_numbers)
   sum = 0
   items_to_be_summed = array_of_numbers.length - 1
   array_of_numbers.each_with_index do |value, index|
       break if index == items_to_be_summed
       sum = sum + value
   end
   sum
end

def subtraction(sum_of_items)
   isbn13_mod10 = sum_of_items%10
   check_digit = 10 - isbn13_mod10
   check_digit % 10
end

def isbn13_checksum(input_string)
   array = convert_string_to_array(input_string)
   x_array = multiply_array(array)
   summed_array = sum_of_items(x_array)
   check_sum = subtraction(summed_array)
   check_sum
end