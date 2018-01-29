defmodule MAINTest do
  use ExUnit.Case
  doctest MAIN

test "should remove spaces and symbols from phone number" do
        input = "039 298-72-30"
        expected = "0392987230"     
        assert MAIN.clean_phone_number(input) == expected
end

test "should return false if a phone number is the beginning of anothers phone number" do
        inputPhoneNumber = "123"
        testedPhoneNumber = "1234"
        expected = false     
        assert MAIN.is_consistant(inputPhoneNumber,testedPhoneNumber) == expected
end

test "should return true if a phone number is not the beginning of anothers phone number" do
        inputPhoneNumber = "123"
        testedPhoneNumber = "1244"
        expected = true     
        assert MAIN.is_consistant(inputPhoneNumber,testedPhoneNumber) == expected
end

test "should return true if a phone number is the same as another phone number" do
        inputPhoneNumber = "123"
        testedPhoneNumber = "123"
        expected = true
        assert MAIN.is_consistant(inputPhoneNumber,testedPhoneNumber) == expected
end

test "should return a list of clean phone numbers from records" do
        input = 
        [
                %{"Name"  => "Kimberlee Turlington", "Phone Number" => "039 298-72-30"},
                %{"Name"  => "Miguel Eveland", "Phone Number"  => "032-2659094"}
        ]

        expected = 
        [
                "0322659094",
                "0392987230"
                
        ]     
        assert MAIN.extract_phone_number_from_maps_to_list(input,[]) == expected
end

test "should return true if all unique phone numbers in list are consistant" do
        input = 
        [
                "0322659094",
                "0392987230"
        ]    
        initialState = false

        expected = true
        assert MAIN.check_consistancy(input, initialState) == expected
end

test "should return true if all non unique phone numbers in list are consistant" do
        input = 
        [
                "0322659094",
                "0322659094",
                "0392987230"
        ]    
        initialState = false

        expected = true
        assert MAIN.check_consistancy(input, initialState) == expected
end

test "should return false if all phone numbers in list are not consistant" do
        input = 
        [
                "0322659094",
                "03226590944"
        ]    
         initialState = false

        expected = false
        assert MAIN.check_consistancy(input, initialState) == expected
end

end
