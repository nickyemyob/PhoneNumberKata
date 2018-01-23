defmodule MAINTest do
  use ExUnit.Case
  doctest MAIN

  test "should be consistant when a phone number is not the start of another phone number" do
    input = "Name,Phone Number" + '\n'
            "Kimberlee Turlington,039 298-72-30" + '\n'
            "Miguel Eveland,032-2659094" + '\n'
            "Audrie Smid,03758295-10 32" + '\n'
            "Antonia Maslanka,00594-83-34 93"
    expected = true
    assert MAIN.isConsistant() == expected
  end

  test "should remove names and heading from data" do
    input = "Name,Phone Number" + '\n'
            "Kimberlee Turlington,039 298-72-30" + '\n'
            "Miguel Eveland,032-2659094" + '\n'
            "Audrie Smid,03758295-10 32" + '\n'
            "Antonia Maslanka,00594-83-34 93"

    expected = "0392987230" + '\n'
            "0322659094" + '\n'
            "037582951032" + '\n'
            "00594833493"

    assert MAIN.clean() == expected

end
