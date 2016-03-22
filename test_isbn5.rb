require "minitest/autorun"
require_relative "isbn5.rb"

class TestIsbn < Minitest::Test

	def test_the_string_without_numbers
		assert_equal(false, valid_isbn?(" "))
		assert_equal(false, valid_isbn?("16586425"))
	end






end