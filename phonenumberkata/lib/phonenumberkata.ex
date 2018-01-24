defmodule MAIN do
  def main do
    getFile()
    |> convertToMaps()

  end

  def getFile do
    File.stream!("phone_data.csv") 
    |> CSV.decode(headers: true)
  end

  def convertToMaps(stream) do
    Enum.to_list(stream)
  end

# %{"Name" => a, "Phone Number" => b}
  # def dropName(list) do
  #   Enum.each(list, Map.drop(%{"Name": a, "Phone Number": b}, [:Name]))
    
  # end


  # def clean(stream) do
  #   Stream.map([stream], fn(x) -> removeName(x) end)
  #   |> Enum.take(1)
  # end

  # def removeName(ok: %{"Name" => val1, "Phone Number" => val2}) do
  #   Map.drop(%{"Name" => val1, "Phone Number" => val2}, [:Name])
  # end

end
