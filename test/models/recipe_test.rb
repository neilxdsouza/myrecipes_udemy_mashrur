require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @recipe =  Recipe.new(name: 'chicken parm', summary: 'Awesome chicken parm',
                  description: "heat oil, fry onions, add chillies add chicken, cook for 1 hour")
  end

  test "recipe should be valid" do
    assert @recipe.valid?

  end

  test "name should be present" do
    @recipe.name = ""
    assert_not @recipe.valid?
  end

  test "name_len shold not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end

  test "name_len shold not be too short" do
    @recipe.name = "a" * 4
    assert_not @recipe.valid?
  end

  test "summary should be present" do
    @recipe.summary = ""
    assert_not @recipe.valid?
  end

  test "summary_len shold not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end

  test "summary_len shold not be too short" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = ""
    assert_not @recipe.valid?
  end

  test "description_len shold not be too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end

  test "description_len shold not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end


end
