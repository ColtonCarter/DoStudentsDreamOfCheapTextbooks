require 'test_helper'

class Table1Copy1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @table1_copy1 = table1_copy1s(:one)
  end

  test "should get index" do
    get table1_copy1s_url
    assert_response :success
  end

  test "should get new" do
    get new_table1_copy1_url
    assert_response :success
  end

  test "should create table1_copy1" do
    assert_difference('Table1Copy1.count') do
      post table1_copy1s_url, params: { table1_copy1: {  } }
    end

    assert_redirected_to table1_copy1_url(Table1Copy1.last)
  end

  test "should show table1_copy1" do
    get table1_copy1_url(@table1_copy1)
    assert_response :success
  end

  test "should get edit" do
    get edit_table1_copy1_url(@table1_copy1)
    assert_response :success
  end

  test "should update table1_copy1" do
    patch table1_copy1_url(@table1_copy1), params: { table1_copy1: {  } }
    assert_redirected_to table1_copy1_url(@table1_copy1)
  end

  test "should destroy table1_copy1" do
    assert_difference('Table1Copy1.count', -1) do
      delete table1_copy1_url(@table1_copy1)
    end

    assert_redirected_to table1_copy1s_url
  end
end
