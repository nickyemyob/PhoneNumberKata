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

  # def is_consistant([head | tail]) do
  #   copyList = tail
  #   is_consistant([])
  # end
  
  # def is_consistant([]) do
  # end

  def clean_phone_number(phoneNumber) do
    Regex.replace(~r/\D/, phoneNumber, "")
  end

  def check_consistancy(phoneNumber, phoneNumberFromList) do
    cleanedPhoneNumber = clean_phone_number(phoneNumber)
    cleanedPhoneNumberFromList = clean_phone_number(phoneNumberFromList)
    cleanedPhoneNumber == String.slice(cleanedPhoneNumberFromList,0,String.length(cleanedPhoneNumber)) 
  end

  def extract_phone_number_from_list([currentRecord | listOfRecords], listOfPhoneNumbers) do
    listOfPhoneNumbers = [clean_phone_number(currentRecord["Phone Number"]) | listOfPhoneNumbers]
    extract_phone_number_from_list(listOfRecords, listOfPhoneNumbers)
  end
  
  def extract_phone_number_from_list([], listOfPhoneNumbers) do
    listOfPhoneNumbers
  end

end
