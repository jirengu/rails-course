require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "ruoyu study rails"
  end

  test "should get index" do
    get root_url   #和router.rb里面的 get 路由相对应
    assert_response :success
  end

  test "should get home" do
    get index_url  # 因为在router.rb 里面做了 as 别名设置
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get login" do
    get login_url
    assert_response :success
    assert_select "title", "Login | #{@base_title}"
  end



end
