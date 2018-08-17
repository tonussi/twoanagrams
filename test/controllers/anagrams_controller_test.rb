require 'test_helper'

class AnagramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anagram = anagrams(:one)
  end

  test "should get index" do
    get anagrams_url
    assert_response :success
  end

  test "should get new" do
    get new_anagram_url
    assert_response :success
  end

  test "should create anagram" do
    assert_difference('Anagram.count') do
      post anagrams_url, params: { anagram: { firstword: @anagram.firstword, matching: @anagram.matching, secondword: @anagram.secondword } }
    end

    assert_redirected_to anagram_url(Anagram.last)
  end

  test "should show anagram" do
    get anagram_url(@anagram)
    assert_response :success
  end

  test "should get edit" do
    get edit_anagram_url(@anagram)
    assert_response :success
  end

  test "should update anagram" do
    patch anagram_url(@anagram), params: { anagram: { firstword: @anagram.firstword, matching: @anagram.matching, secondword: @anagram.secondword } }
    assert_redirected_to anagram_url(@anagram)
  end

  test "should destroy anagram" do
    assert_difference('Anagram.count', -1) do
      delete anagram_url(@anagram)
    end

    assert_redirected_to anagrams_url
  end
end
