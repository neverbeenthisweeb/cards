defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # List comprehension is internally a mapping function
    # As it is a mapping function, nested for loop is quite tricky
    # List in Elixir is a linked list (OH WHY?)
    for s <- suits, v <- values do
      "#{v} of #{s}"
    end
  end

  # Arity means the number of accepted args
  # /0 means 0, /1 means 1 arg
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  # The question mark `?` is just a semantic
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  # How to access a value in a tuple?
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
end
