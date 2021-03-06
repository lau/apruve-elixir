defmodule Apruve.OrderItem do
  @moduledoc """
  Module for Apruve order items.
  """

  defstruct [
    :id,
    :title,
    :price_total_cents,
    :price_ea_cents,
    :currency,
    :quantity,
    :description,
    :merchant_notes,
    :variant_info,
    :sku,
    :vendor,
    :view_product_url,
    :links
  ]

  alias __MODULE__

  def from_parsed_json(json_parsed) do
    keys = %Apruve.OrderItem{} |> Map.from_struct() |> Map.keys()

    json_parsed
    |> Enum.map(fn order_item_json_parsed ->
      Enum.reduce(keys, %OrderItem{}, fn key, acc ->
        Map.put(acc, key, order_item_json_parsed[Atom.to_string(key)])
      end)
    end)
  end
end
