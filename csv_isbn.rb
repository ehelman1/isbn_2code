require_relative "isbn4.rb"
require "csv"

file = File.open("filename.csv", "w")

CSV.foreach('isbn_exapmle_for_validity.csv') do |row|
	if row[0] == "ITEM"
		isbn_check = "CHECKS"
	elsif valid_isbn?(row[1]) == true
		isbn_check = "Valid" 
	else
		isbn_check = "Invalid"
	end
	file << row[0] + ", " + row[1] + ", " + isbn_check + "\n"
end

file.close	