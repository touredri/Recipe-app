# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  before(:each) do
    user = create(:user)
    assign(:recipe, Recipe.create!(
                      name: 'Name',
                      user: user,
                      description: 'MyText',
                      preparation_time: '1.3',
                      cooking_time: '2.3',
                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
