defmodule MAIN do
  def main do
    getFile()
    |> convertToMaps()
    # |> Enum.each(&dropName(&1))
    # |> Enum.take(1)

  end

  def getFile do
    File.stream!("phone_data.csv") 
    |> CSV.decode(headers: true)
  end

  def convertToMaps(stream) do
    Enum.to_list(stream)
  end

  def dropName(map) do
    Map.drop(map, ["Name"])
  end
  end
  

end
