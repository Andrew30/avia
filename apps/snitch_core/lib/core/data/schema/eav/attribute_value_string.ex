defmodule Snitch.Data.Schema.EAV.String do
  @moduledoc """
  Models the String type for EAV structure.

  The table related to this schema stores data for all the
  attributes which have data type as string.
  """

  use Snitch.Data.Schema
  alias Snitch.Data.Schema.EAV.Attribute

  schema "snitch_eav_type_string" do
    field(:value, :string)

    belongs_to(:attribute, Attribute, on_replace: :delete)

    timestamps()
  end

  @required ~w(attribute_id value)a

  def changeset(%__MODULE__{} = data, params) do
    data
    |> cast(params, @required)
    |> validate_required(@required)
  end
end