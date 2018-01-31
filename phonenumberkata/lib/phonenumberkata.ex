defmodule MAIN do
  def main() do
    get_file("test_data.csv")
    |> convert_to_maps
    |> extract_phone_number_from_maps_to_list([])
    |> Enum.sort
    |> check_consistancy(false)
  end

  def get_file(filename) do
    File.stream!(filename) 
    |> CSV.decode!(headers: true)
  end

  def convert_to_maps(stream) do
    Enum.to_list(stream)
  end

  def clean_phone_number(phoneNumber) do
    Regex.replace(~r/\D/, phoneNumber, "")
  end

  def extract_phone_number_from_maps_to_list([currentRecord | listOfRecords], listOfPhoneNumbers) do
    listOfPhoneNumbers = [clean_phone_number(currentRecord["Phone Number"]) | listOfPhoneNumbers]
    extract_phone_number_from_maps_to_list(listOfRecords, listOfPhoneNumbers)
  end
  
  def extract_phone_number_from_maps_to_list([], listOfPhoneNumbers) do
    listOfPhoneNumbers
  end

  def is_consistant(phoneNumber, phoneNumberFromList) do
    if String.length(phoneNumberFromList) > String.length(phoneNumber) do
      !(phoneNumber == String.slice(phoneNumberFromList,0,String.length(phoneNumber))
       && String.length(phoneNumber) != String.length(phoneNumberFromList))
    else
      !(phoneNumberFromList == String.slice(phoneNumber,0,String.length(phoneNumberFromList))
       && String.length(phoneNumberFromList) != String.length(phoneNumber))
    end
  end

  def check_consistancy([head | tail], consistancy) do
      if tail != [] do
        consistancy = Enum.all?(tail,fn(x) -> is_consistant(head, x) end)
      end
      if !consistancy do
        check_consistancy([], consistancy) 
      else
        IO.puts(head)
        check_consistancy(tail, consistancy)
      end
  end

  def check_consistancy([], consistancy) do
    consistancy
  end


end
