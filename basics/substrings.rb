# frozen_string_literal: true

# app.rb

def substrings(word, dictionary)
  word = word.downcase
  results = {}

  dictionary.each do |substring|
    count = word.count(substring)
    results[substring] = count if count.positive?
  end

  results
end
