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






end