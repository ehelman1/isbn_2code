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