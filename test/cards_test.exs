defmodule CardsTest do
  use ExUnit.Case
  # Enable doctest
  doctest Cards

  test "create_deck should makes 20 cards" do
    deck_length = length(Cards.create_deck())
    assert deck_length == 12
  end

  test "shuffle should return shuffled deck" do
    deck = Cards.create_deck()
    s_deck = Cards.shuffle(deck)
    # refute <> assert
    refute deck == s_ = deck
    # assert deck != s_deck
    assert length(deck) == length(s_deck)
  end
end
