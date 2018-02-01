require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'should not save without a name' do
    product = Product.new(code: 1)
    assert_not product.save
  end

  test 'should not save without a code' do
    product = Product.new(name: 'Test')
    assert_not product.save
  end

  test 'should not save without a unique code' do
    product = Product.new(name: 'Test', code: 2)
    assert_not product.save
  end

  test 'should save' do
    product = Product.new(name: 'Test', code: 1)
    assert product.save
  end

  test 'should filter by name' do
    assert_equal 2, Product.all.size
    assert_equal 1, Product.by_name('1').size
  end

  test 'should filter by code' do
    assert_equal 2, Product.all.size
    assert_equal 1, Product.by_code('2').size
  end
end
