require "application_system_test_case"

class AnagramsTest < ApplicationSystemTestCase
  setup do
    @anagram = anagrams(:one)
  end

  test "visiting the index" do
    visit anagrams_url
    assert_selector "h1", text: "Anagrams"
  end

  test "creating a Anagram" do
    visit anagrams_url
    click_on "New Anagram"

    fill_in "Firstword", with: @anagram.firstword
    fill_in "Matching", with: @anagram.matching
    fill_in "Secondword", with: @anagram.secondword
    click_on "Create Anagram"

    assert_text "Anagram was successfully created"
    click_on "Back"
  end

  test "updating a Anagram" do
    visit anagrams_url
    click_on "Edit", match: :first

    fill_in "Firstword", with: @anagram.firstword
    fill_in "Matching", with: @anagram.matching
    fill_in "Secondword", with: @anagram.secondword
    click_on "Update Anagram"

    assert_text "Anagram was successfully updated"
    click_on "Back"
  end

  test "destroying a Anagram" do
    visit anagrams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Anagram was successfully destroyed"
  end
end
