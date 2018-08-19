require 'test_helper'

class AnagramTest < ActiveSupport::TestCase
  attr_accessor :anagrams_path
  @anagrams_path = "/anagrams"

  test "creating an two anagram matching scenario" do
    visit @anagrams_path
   
    click_on "New Anagram"
   
    fill_in "Firstword", with: "9000e"
    fill_in "Secondword", with: "e0009"
   
    click_on "Create Anagram"

    assert_text "Creating an anagram matching scenario"
  end

  test "updating an two anagram matching scenario" do
    visit @anagrams_path
   
    click_on "New Anagram"
   
    fill_in "Firstword", with: "90f00e"
    fill_in "Secondword", with: "e0f009"
   
    click_on "Update Anagram"

    assert_text "Update an anagram matching scenario"
  end
end
