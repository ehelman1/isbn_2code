require 'minitest/autorun'
require_relative 'isbn4.rb'

class TestIsbnChecker < Minitest::Test

   def test_string_without_10_or_13_numbers
       assert_equal(false, valid_isbn?(""))
       assert_equal(false, valid_isbn?("123456789123"))
       assert_equal(false, valid_isbn?("12345678912345"))
   end

   def test_valid_isbn10_returns_true
       assert_equal(true, valid_isbn?("0471958697"))
   end

   def test_valid_isbn10_with_spaces_returns_true
       assert_equal(true, valid_isbn?("047 1958 697"))
   end

   def test_valid_isbn10_with_hyphens_returns_true
       assert_equal(true, valid_isbn?("0-321-14653-0"))
   end

   def test_valid_isbn10_with_spaces_and_hyphens_returns_true
       assert_equal(true, valid_isbn?(" 047-1958 697-"))
   end

	def test_valid_isbn13_returns_true
		assert_equal(true, valid_isbn?("9780470059029"))
   end

   def test_valid_isbn13_with_spaces_and_hyphens_returns_true
       assert_equal(true, valid_isbn?("-9  7---80470059029"))
       assert_equal(true, valid_isbn?("978-0-13-149505-0"))
       assert_equal(true, valid_isbn?("978 0 471 48648 0"))
   end

   def test_invalid_isbn13_returns_false
       assert_equal(false, valid_isbn13?("4780131495050"))
   end

   def test_convert_string_to_array_of_characters
       assert_equal(["1","2","3","4","5","6","7"],convert_string_to_array("1234567"))
   end

   def test_multiply_array_by_1_and_3
       skip("Test in Progress")
       assert_equal([1,3,1,3,1,3], multiply_array(["1","1","1","1","1","1"]))
       assert_equal([1,6,3,9,2,3], multiply_array(["1","2","3","3","2","1"]))
   end


   def test_sum_items_in_an_array
       assert_equal(6, sum_of_items([1,2,3,4]))
       assert_equal(13, sum_of_items([3,2,8,2]))
   end
   
   def test_isbn_13_checksum
       assert_equal(0, isbn13_checksum("9780131495050"))
       assert_equal(9, isbn13_checksum("9780470059029"))
       assert_equal(0, isbn13_checksum("9780471486480"))
   end
   
   def test_valid_isbn_13_sincheck
		assert_equal(true, valid_isbn13?("9780470059029"))
	end
	
	def test_valid_isbn13_main
		assert_equal(true, valid_isbn?("978-0-13-149505-0"))
		assert_equal(true, valid_isbn?("978 0 471 48648 0"))
	end
	
	def test_nith_place_is_10
		assert_equal("87719586910", x_checker("877195869x"))
		assert_equal("03302898710", x_checker("033028987x"))
		assert_equal("3880531013", x_checker("3880531013"))
	end
	
	def test_valid_isbn10_math_true
		assert_equal(true, valid_isbn10?(["0306406152"]))
	end
end