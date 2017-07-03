defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck generates 20 cards" do
    deck_length = length(Cards.create_deck)
    assert(deck_length == 20)
  end

  test "shuffle randomizes the deck" do
    deck = Cards.create_deck
    assert(deck != Cards.shuffle(deck))
  end
end
