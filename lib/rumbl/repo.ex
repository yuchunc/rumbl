defmodule Rumbl.Repo do
  # use Ecto.Repo, otp_app: :rumbl
  @moduledoc """
  In memory repo.
  """

  def all(Rumbl.User) do
    [%Rumbl.User{id: "1", name: "Mickey", username: "mickey", password: "geek"},
      %Rumbl.User{id: "2", name: "Vicky", username: "vicky", password: "wife"},
      %Rumbl.User{id: "3", name: "Xun", username: "xun", password: "son"},
    ]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
