require 'test_helper'

class UtilisateurControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get utilisateur_index_url
    assert_response :success
  end

  test "should get show" do
    get utilisateur_show_url
    assert_response :success
  end

  test "should get new" do
    get utilisateur_new_url
    assert_response :success
  end

end
