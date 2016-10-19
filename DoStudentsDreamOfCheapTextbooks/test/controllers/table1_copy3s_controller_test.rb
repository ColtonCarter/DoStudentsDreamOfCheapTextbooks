require 'test_helper'

class Table1Copy3sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @table1_copy3 = table1_copy3s(:one)
  end

  test "should get index" do
    get table1_copy3s_url
    assert_response :success
  end

  test "should get new" do
    get new_table1_copy3_url
    assert_response :success
  end

  test "should create table1_copy3" do
    assert_difference('Table1Copy3.count') do
      post table1_copy3s_url, params: { table1_copy3: { table1col1: @table1_copy3.table1col1, table1col: @table1_copy3.table1col } }
    end

    assert_redirected_to table1_copy3_url(Table1Copy3.last)
  end

  test "should show table1_copy3" do
    get table1_copy3_url(@table1_copy3)
    assert_response :success
  end

  test "should get edit" do
    get edit_table1_copy3_url(@table1_copy3)
    assert_response :success
  end

  test "should update table1_copy3" do
    patch table1_copy3_url(@table1_copy3), params: { table1_copy3: { table1col1: @table1_copy3.table1col1, table1col: @table1_copy3.table1col } }
    assert_redirected_to table1_copy3_url(@table1_copy3)
  end

  test "should destroy table1_copy3" do
    assert_difference('Table1Copy3.count', -1) do
      delete table1_copy3_url(@table1_copy3)
    end

    assert_redirected_to table1_copy3s_url
  end
end
