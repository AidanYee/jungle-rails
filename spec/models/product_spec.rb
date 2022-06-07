require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    @category = Category.create(name: "motorcycles")

    it "should have all fields present" do
      product = Product.new(
        name: 'Super Duke 1290R',
        price: 300,
        quantity: 1,
        category: @category
      )
    end

    it "should have a name" do
      product = Product.new(
        name: nil,
        price: 300,
        quantity: 1,
        category: @category
      )

      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include 'Name can\'t be blank'
    end

    it "should have a price" do
      product = Product.new(
        name: 'S1000RR',
        price: nil,
        quantity: 1,
        category: @category
      )

      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include 'Category can\'t be blank'
    end

    it "should have a quantity" do
      product = Product.new(
        name: 'GSX-R 1000',
        price: nil,
        quantity: nil,
        category: @category
      )

      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include 'Quantity can\'t be blank'
    end

    it "should have a category" do
      product = Product.new(
        name: 'YZF-R1',
        price: nil,
        quantity: nil,
        category: nil
      )

      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include 'Category can\'t be blank'
    end
  end
end