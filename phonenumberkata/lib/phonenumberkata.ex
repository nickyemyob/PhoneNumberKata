defmodule MAIN do
  def main do
    getFile()
    |> convertToMaps()
  end

  def getFile do
    File.stream!("phone_data.csv") 
    |> CSV.decode!(headers: true)
  end

  def convertToMaps(stream) do
    Enum.to_list(stream)
  end

  # def dropName(map) do
  #   Map.drop(map, ["Name"])
  # end

  # def cleanPhoneNumber(map) do
  #  Map.get_and_update(map, "Phone Number", fun) #todo
  # end

  # def loop([head | tail]) do
  #   copyList = tail

  # loop([])
  # end
  
  # def loop([]) do
  # end

  def cleanPhoneNumber(phoneNumber) do
    Regex.replace(~r/\D/, phoneNumber, "")
  end

  def checkConsistancy(phoneNumber, phoneNumberFromList) do
    cleanedPhoneNumber = cleanPhoneNumber(phoneNumber)
    cleanedPhoneNumberFromList = cleanPhoneNumber(phoneNumberFromList)
    cleanedPhoneNumber == String.slice(cleanedPhoneNumberFromList,0,String.length(cleanedPhoneNumber)) 
  end

end
