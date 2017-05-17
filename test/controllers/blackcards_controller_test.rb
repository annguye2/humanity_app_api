require 'test_helper'

class BlackcardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blackcard = blackcards(:one)
  end

  test "should get index" do
    get blackcards_url, as: :json
    assert_response :success
  end

  test "should create blackcard" do
    assert_difference('Blackcard.count') do
      post blackcards_url, params: { blackcard: { category: @blackcard.category, is_deal: @blackcard.is_deal, pick: @blackcard.pick, player_won: @blackcard.player_won, question: @blackcard.question, rating: @blackcard.rating } }, as: :json
    end

    assert_response 201
  end

  test "should show blackcard" do
    get blackcard_url(@blackcard), as: :json
    assert_response :success
  end

  test "should update blackcard" do
    patch blackcard_url(@blackcard), params: { blackcard: { category: @blackcard.category, is_deal: @blackcard.is_deal, pick: @blackcard.pick, player_won: @blackcard.player_won, question: @blackcard.question, rating: @blackcard.rating } }, as: :json
    assert_response 200
  end

  test "should destroy blackcard" do
    assert_difference('Blackcard.count', -1) do
      delete blackcard_url(@blackcard), as: :json
    end

    assert_response 204
  end
end
