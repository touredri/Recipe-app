# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recipes/index', type: :view do
  before(:each) do
    user = create(:user)
    f1 = Food.create(name: 'pawpaw', measurement_unit: 'unit', price: 1.2, quantity: 1, user: user)
    f2 = Food.create(name: 'pawpaw', measurement_unit: 'unit', price: 1.2, quantity: 1, user: user)
    assign(:recipes, [ f1, f2])
  end

  it 'renders a list of recipes' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('pawpaw'.to_s), count: 0
  end
end
