require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @product = products(:one)
    sign_in employees(:admin)
  end

  test 'should get index' do
    get products_url
    assert_response :success
  end

  test 'index should retrieve products' do
    get products_url
    @products = assigns(:products)
    assert_not_nil @products
  end

  test 'should show product' do
    get product_url(@product)
    assert_response :success
  end

  test 'should get new' do
    get new_product_url
    assert_response :success
  end

  test 'should create product' do
    assert_difference('Product.count') do
      post products_url, params: { product: { code: 1, name: 'Test' } }
    end

    assert_redirected_to products_url
  end

  test 'should get edit' do
    get edit_product_url(@product)
    assert_response :success
  end

  test 'edit should retrieve the product' do
    get edit_product_url(@product)
    assert_equal assigns(:product), @product
  end

  test 'should update product' do
    patch product_url(@product), params: { product: { code: @product.code,
                                                      name: @product.name } }
    assert_redirected_to products_url
  end

  test 'should destroy product' do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
