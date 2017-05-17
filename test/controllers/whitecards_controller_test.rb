require 'test_helper'

class WhitecardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @whitecard = whitecards(:one)
  end

  test "should get index" do
    get whitecards_url, as: :json
    assert_response :success
  end

  test "should create whitecard" do
    assert_difference('Whitecard.count') do
      post whitecards_url, params: { whitecard: { answer: @whitecard.answer, category: @whitecard.category, player: @whitecard.player, rating: @whitecard.rating } }, as: :json
    end

    assert_response 201
  end

  test "should show whitecard" do
    get whitecard_url(@whitecard), as: :json
    assert_response :success
  end

  test "should update whitecard" do
    patch whitecard_url(@whitecard), params: { whitecard: { answer: @whitecard.answer, category: @whitecard.category, player: @whitecard.player, rating: @whitecard.rating } }, as: :json
    assert_response 200
  end

  test "should destroy whitecard" do
    assert_difference('Whitecard.count', -1) do
      delete whitecard_url(@whitecard), as: :json
    end

    assert_response 204
  end
end
