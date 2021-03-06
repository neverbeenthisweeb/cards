defmodule Cards do
  @moduledoc """
    Provides method for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
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

  @doc """
    Determines whether a `deck` contains a  `card`.

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  # The question mark `?` is just a semantic
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should
    be in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> { hand, deck } = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  # How to access a value in a tuple?
  # Pattern matching is Elixir's replacement for variable assignment
  # { hand, rest_of_deck } = deal(deck, hand_size)
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
