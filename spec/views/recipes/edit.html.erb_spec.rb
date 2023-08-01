# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recipes/edit', type: :view do
  let(:recipe) do
    Recipe.create!(
      name: 'MyString'
    )
  end

  before(:each) do
    assign(:recipe, recipe)
  end

  it 'renders the edit recipe form' do
    render

    assert_select 'form[action=?][method=?]', recipe_path(recipe), 'post' do
      assert_select 'input[name=?]', 'recipe[name]'
    end
  end
end
