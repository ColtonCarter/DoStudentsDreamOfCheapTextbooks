require 'test_helper'

class Table1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @table1 = table1s(:one)
  end

  test "should get index" do
    get table1s_url
    assert_response :success
  end

  test "should get new" do
    get new_table1_url
    assert_response :success
  end

  test "should create table1" do
    assert_difference('Table1.count') do
      post table1s_url, params: { table1: {  } }
    end

    assert_redirected_to table1_url(Table1.last)
  end

  test "should show table1" do
    get table1_url(@table1)
    assert_response :success
  end

  test "should get edit" do
    get edit_table1_url(@table1)
    assert_response :success
  end

  test "should update table1" do
    patch table1_url(@table1), params: { table1: {  } }
    assert_redirected_to table1_url(@table1)
  end

  test "should destroy table1" do
    assert_difference('Table1.count', -1) do
      delete table1_url(@table1)
    end

    assert_redirected_to table1s_url
  end
end
