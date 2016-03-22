require "minitest/autorun"
require_relative "isbn5.rb"

class TestIsbn < Minitest::Test

	def test_the_string_without_numbers
		assert_equal(false, valid_isbn?(" "))
		assert_equal(false, valid_isbn?("16586425"))
	end
	
	def test_for_10_and_13_valid_isbn_length
		assert_equal(true, correct_length?("0471958697"))
		assert_equal(true, correct_length?("9780470059029"))
	end
	
	def test_spaces_and_hyphens_are_removed
		assert_equal("0471958697", remove_invalid("04 71-95-8697"))
		assert_equal("9780470059029", remove_invalid("97-80 4700-59 0-29"))
	end
	
	def test_convert_string_to_array
		assert_equal(["1","2","3","4"], split_string("1234"))
	end
	
	def test_multiply_array_1_and_3
		assert_equal([1,3,1,3,1,3], multiply_isbn13(["1","1","1","1","1","1"]))
		assert_equal([2,12,6,24], multiply_isbn13(["2","4","6","8"]))
	end

	def test_sum_of_array_13
		assert_equal(20, sum_isbn13([2,12,6,24]))
	end





end