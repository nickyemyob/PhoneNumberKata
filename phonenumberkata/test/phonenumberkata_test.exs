defmodule MAINTest do
  use ExUnit.Case
  doctest MAIN

test "get the contents of file and convert to list of maps" do
        expected =
        [
                %{"Name"  => "Kimberlee Turlington", "Phone Number" => "039 298-72-30"},
                %{"Name"  => "Miguel Eveland", "Phone Number"  => "032-2659094"}
        ]
        input = File.stream!("test_data.csv") |> CSV.decode!(headers: true)
        assert MAIN.convert_to_maps(input) == expected
end

# test "should return true if a list of phone numbers is inconsistant" do
#         input =[%{"Name"  => "Kimberlee Turlington", "Phone Number" => "039 298-72-30"},
#                    %{"Name"  => "Miguel Eveland", "Phone Number"  => "032-2659094"}]
#         expected = true
#         assert MAIN.is_consistant(input) == expected
# end

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
        assert MAIN.extract_phone_number_from_list(input,[]) == expected
end

end
