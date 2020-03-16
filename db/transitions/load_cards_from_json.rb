# frozen_string_literal: true

class LoadCardsFromJson
  DATA_PATH = "./data/cards/"

  def self.run
    new.run
  end

  def run
    files.each do |filename|
      load_file(filename)
    end
  end

  private

  def files
    Dir["#{DATA_PATH}*"]
  end

  def load_file(filename)
    card_set = CardSet.find_or_create_by!(name: formatted_filename(filename))

    file = File.read(filename)
    cards = JSON.parse(file)
    load_black_cards(cards["blackCards"], card_set)
    load_white_cards(cards["whiteCards"], card_set)
  end

  def formatted_filename(filename)
    filename.gsub(DATA_PATH, "").gsub(/_/, " ").gsub(".json", "").titlecase
  end

  def load_black_cards(black_cards, card_set)
    black_cards.each do |card|
      next unless card["text"].present?

      BlackCard.find_or_create_by!(
        text: card["text"],
        pick: card["pick"],
        card_set: card_set
      )
    end
  end

  def load_white_cards(white_cards, card_set)
    white_cards.each do |card|
      WhiteCard.find_or_create_by!(
        text: card,
        card_set: card_set
      )
    end
  end
end
