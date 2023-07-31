# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'foods/show', type: :view do
  before(:each) do
    assign(:food, Food.create!(
                    name: 'Name'
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
