defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Diamonds", "Hearts"]
    for  suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Returns a list of shuffled list of strings representing a deck of cards
    'deck' indicates the list of strings of cards to shuffle
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Returns if a list of strings contains a certain card
    'deck' indicates the list of strings of cards
    'card' string representing a card
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and a remainder of the stack
    'hand_size' indicates the number of cards to deal
  
  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, _deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves a deck of cards(strings representing a card) to a local disk
    'deck' indicates the list of strings of cards.
    'filename' filename to be saved, includes filepath.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loads a deck of cards(strings representing a card) to memory
    'filename' filename of the deck file, includes filepath.
  """
  def load(filename) do
    case File.read(filename) do 
      { :ok, binary } -> :erlang.binary_to_term binary
      { :error, _ } -> "File does not exist"
    end
  end

  @doc """
    Returns the hand and the remaining deck of cards
    'hand_size' indicates the number of cards on a hand
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
