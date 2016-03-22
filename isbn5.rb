def valid_isbn?(string)
	if " "
		false
	end
end

def correct_length?(string)
	if string.length == 10 || string.length == 13
		true
	else
		false
	end
end

def remove_invalid(string)
	string.delete!(" ")
	string.delete!("-")
end

def split_string(string)
	string.split("")
end

def isbn13(input_array)
	array = []
	input_array.each_with_index do|value, index|
	value = value.to_i
		if index % 2 == 0
			array << value * 1
		else 
			array << value * 3
		end
	end
	array
end
	
	
	
