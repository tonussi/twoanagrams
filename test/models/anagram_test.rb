require 'test_helper'

class AnagramTest < ActiveSupport::TestCase
  test "creating an two anagram matching scenario" do
    visit anagram_path
   
    click_on "New Anagram"
   
    fill_in "Title", with: "Creating an AnagramMatchingScenario"
    fill_in "Body", with: "Created this AnagramMatchingScenario successfully!"
   
    click_on "Create AnagramMatchingScenario"
   
    assert_text "Creating an AnagramMatchingScenario"
  end
end
