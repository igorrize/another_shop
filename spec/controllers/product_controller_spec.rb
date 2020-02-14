require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  let(:product) {FactoryBot.create(:product, category_id: 50)}
  let(:product) {FactoryBot.create(:product, category_id: 1, price: 111)}
  let(:product) {FactoryBot.create(:product, price: 98)}
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET #index with category' do
    it 'returns products on selected category' do
      get :index, params: {filterrific: {category_id: 50}}
      expect(assigns(:products).count).to eq(1)
    end
  end
  describe 'GET #index with price between' do
    it 'returns products with price in between params' do
      get :index, params: {filterrific: {between_price: '90-99' }}
      expect(assigns(:products).count).to eq(1)
    end
  end
end
# Parameters: {"utf8"=>"✓", "filterrific"=>{"search_query"=>"", "shipment_item_id"=>"", "created_between"=>"14/02/2020 - 14/02/2020", "deal_number"=>"", "with_state"=>"", "with_from_city"=>"", "with_repair_type"=>"", "with_kind"=>"", "with_transport_company_id"=>"1"}, "commit"=>"Найти"}

# @filterrific = initialize_filterrific(
#     Product,
#     params[:filterrific],
#     select_options: {
#         sorted_by: Product.options_for_sorted_by,
#         with_category_id: Category.options_for_select,
#     },
#     persistence_id: "shared_key",
#     default_filter_params: {},
#     available_filters: [:sorted_by, :with_category_id, :between_price],
#     sanitize_params: true,
#     ) || return
# @products = @filterrific.find.page(params[:page])
