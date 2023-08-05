# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'foods/index', type: :view do
  before do
    user = create(:user)
    food1 = create(:food, name: 'Carrot', measurement_unit: 'piece', price: 2, user: user)
    food2 = create(:food, name: 'Apple', measurement_unit: 'piece', price: 3, user: user)
    assign(:foods, [food1, food2])
  end

  it 'displays the food name' do
    config.include Devise::Test::ControllerHelpers, type: :view
    render

    expect(rendered).to have_content('Carrot')
    expect(rendered).to have_content('Apple')
  end

  it 'displays the food measurement unit' do
    render

    expect(rendered).to have_content('piece', count: 2) # Assuming there are two foods with measurement_unit 'piece'
  end

  it 'displays the food price' do
    render

    expect(rendered).to have_content('2')
    expect(rendered).to have_content('3')
  end

  it 'displays the action links' do
    render

    expect(rendered).to have_link('Delete', count: 2)
  end
end
