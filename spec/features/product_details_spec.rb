require 'rails_helper'

RSpec.feature "Visitor navigates from home page to a product details page by clicking on a product", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click on a product and see details page" do
    visit root_path
    first('.product').click_on('Details')

    expect(page).to have_css 'article.product-detail', count: 1
    expect(page).to have_content("10")

    save_screenshot
  end
end