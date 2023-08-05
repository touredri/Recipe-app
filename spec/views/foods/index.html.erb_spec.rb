# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'foods/index', type: :view do
  before(:each) do
    user = create(:user)
    f1 = Food.create(name: 'pawpaw', measurement_unit: 'unit', price: 1.2, quantity: 1, user:)
    f2 = Food.create(name: 'pawpaw', measurement_unit: 'unit', price: 1.2, quantity: 1, user:)
    assign(:foods, [f1, f2])
  end

  it 'renders a list of foods' do
    render
    expect(rendered).to have_content('Measurement unit')
    expect(rendered).to have_content('Unit price')
  end
end
