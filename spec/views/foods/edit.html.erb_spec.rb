# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'foods/edit', type: :view do
  let(:food) do
    Food.create!(
      name: 'MyString'
    )
  end

  before(:each) do
    assign(:food, food)
  end

  it 'renders the edit food form' do
    render

    assert_select 'form[action=?][method=?]', food_path(food), 'post' do
      assert_select 'input[name=?]', 'food[name]'
    end
  end
end
