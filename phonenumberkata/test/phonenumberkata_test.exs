defmodule MAINTest do
  use ExUnit.Case
  doctest MAIN

test "get the contents of file and convert to list of maps" do
        expected =[%{"Name"  => "Kimberlee Turlington", "Phone Number" => "039 298-72-30"},
                   %{"Name"  => "Miguel Eveland", "Phone Number"  => "032-2659094"}]
        input = File.stream!("test_data.csv") |> CSV.decode!(headers: true)
        assert MAIN.convertToMaps(input) == expected
        
end

# test "should remove name from map" do
#         input = %{"Name"  => "Kimberlee Turlington", "Phone Number" => "039 298-72-30"}
#         expected = %{"Phone Number" => "039 298-72-30"}
#         assert MAIN.dropName(input) == expected
# end

# test "should remove spaces and symbols from phone number" do
#         input = %{"Name"  => "Kimberlee Turlington", "Phone Number" => "039 298-72-30"}
#         expected = %{"Name"  => "Kimberlee Turlington", "Phone Number" => "0392987230"}
#         assert MAIN.cleanPhoneNumber(input) == expected
# end

test "should remove spaces and symbols from phone number" do
        input = "039 298-72-30"
        expected = "0392987230"     
        assert MAIN.cleanPhoneNumber(input) == expected
end

test "should return true if a phone number is the beginning of anothers phone number" do
        inputPhoneNumber = "123"
        testedPhoneNumber = "1234"
        expected = true     
        assert MAIN.checkConsistancy(inputPhoneNumber,testedPhoneNumber) == expected
end

test "should return false if a phone number is not the beginning of anothers phone number" do
        inputPhoneNumber = "123"
        testedPhoneNumber = "1244"
        expected = false     
        assert MAIN.checkConsistancy(inputPhoneNumber,testedPhoneNumber) == expected
end

end
