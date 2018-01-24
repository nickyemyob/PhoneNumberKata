defmodule MAINTest do
  use ExUnit.Case
  doctest MAIN

test "get the contents of file and convert to list of maps" do
        expected =[ok: %{"Name"  => "Kimberlee Turlington", "Phone Number" => "039 298-72-30"},
                   ok: %{"Name"  => "Miguel Eveland", "Phone Number"  => "032-2659094"}]
        input = File.stream!("test_data.csv") |> CSV.decode(headers: true)
        assert MAIN.convertToMaps(input) == expected
        
end

# test "should remove name from map" do
#         input = %{"Name"  => "", "Phone Number"  => ""}
#         expected = %{"Phone Number": ""}
#         assert MAIN.dropName(input) == expected
# end




end
