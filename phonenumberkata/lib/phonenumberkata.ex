defmodule MAIN do
  require TEST
  @moduledoc """
  Documentation for MAIN.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MAIN.hello
      :world

  """
  def hello do
    :world
  end

  def test1 do
    TEST.gettest
  end
end
