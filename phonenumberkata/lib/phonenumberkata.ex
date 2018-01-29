defmodule MAIN do
  def main do
    get_file()
    |> convert_to_maps()
  end

  def get_file do
    File.stream!("phone_data.csv") 
    |> CSV.decode!(headers: true)
  end

  def convert_to_maps(stream) do
    Enum.to_list(stream)
  end

  def clean_phone_number(phoneNumber) do
    Regex.replace(~r/\D/, phoneNumber, "")
  end

  def is_consistant(phoneNumber, phoneNumberFromList) do
    cleanedPhoneNumber = clean_phone_number(phoneNumber)
    cleanedPhoneNumberFromList = clean_phone_number(phoneNumberFromList)

    !(cleanedPhoneNumber == String.slice(cleanedPhoneNumberFromList,0,String.length(cleanedPhoneNumber))
     && String.length(cleanedPhoneNumber) != String.length(cleanedPhoneNumberFromList))
  end

  def extract_phone_number_from_maps_to_list([currentRecord | listOfRecords], listOfPhoneNumbers) do
    listOfPhoneNumbers = [clean_phone_number(currentRecord["Phone Number"]) | listOfPhoneNumbers]
    extract_phone_number_from_maps_to_list(listOfRecords, listOfPhoneNumbers)
  end
  
  def extract_phone_number_from_maps_to_list([], listOfPhoneNumbers) do
    listOfPhoneNumbers
  end


  def check_consistancy([head | tail], consistancy) do
      consistancy = Enum.all?(tail,fn(x) -> is_consistant(head, x) end)

      check_consistancy(tail, consistancy)
      

  end

  def check_consistancy([], consistancy) do
    case consistancy do
      true -> true
      false -> false
      nil -> false
    end

  end

end
