require 'test_helper'

class RecipeControllerTest < ActionController::TestCase

  # 楽天APIを利用してピックアップレシピが取得できる
  test "should get pickup via rakuten api" do
    get :pickup
    assert_response :success
    assert_not_nil assigns(:menu)
  end

  # 買い物リストを取得できる
  test "should get shopping list" do
    get :shopping_list
    assert_response :success
    assert_not_nil assigns(:menu)
  end

  # 材料の数量を取得できる
  # @todo 楽天レシピのページ形式と、掲載先レシピの内容に依存している
  # http://recipe.rakuten.co.jp/recipe/1490006283/
  test "should get material amount" do
    get :scrape
    assert_response :success
    assert_not_nil assigns(:mate)
    assert (0 < assigns(:mate).length)  # 材料がないということはないはず
  end
end
