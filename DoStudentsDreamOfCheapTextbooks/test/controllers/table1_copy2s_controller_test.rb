require 'test_helper'

class Table1Copy2sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @table1_copy2 = table1_copy2s(:one)
  end

  test "should get index" do
    get table1_copy2s_url
    assert_response :success
  end

  test "should get new" do
    get new_table1_copy2_url
    assert_response :success
  end

  test "should create table1_copy2" do
    assert_difference('Table1Copy2.count') do
      post table1_copy2s_url, params: { table1_copy2: { table1col1: @table1_copy2.table1col1, table1col: @table1_copy2.table1col } }
    end

    assert_redirected_to table1_copy2_url(Table1Copy2.last)
  end

  test "should show table1_copy2" do
    get table1_copy2_url(@table1_copy2)
    assert_response :success
  end

  test "should get edit" do
    get edit_table1_copy2_url(@table1_copy2)
    assert_response :success
  end

  test "should update table1_copy2" do
    patch table1_copy2_url(@table1_copy2), params: { table1_copy2: { table1col1: @table1_copy2.table1col1, table1col: @table1_copy2.table1col } }
    assert_redirected_to table1_copy2_url(@table1_copy2)
  end

  test "should destroy table1_copy2" do
    assert_difference('Table1Copy2.count', -1) do
      delete table1_copy2_url(@table1_copy2)
    end

    assert_redirected_to table1_copy2s_url
  end
end
