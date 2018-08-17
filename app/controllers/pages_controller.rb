class PagesController < ApplicationController
  # GET /anagrams
  # GET /anagrams.json
  def index
  end

  def welcome
    @anagrams = Anagram.all
  end
end
