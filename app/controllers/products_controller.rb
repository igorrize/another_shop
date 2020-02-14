class ProductsController < ApplicationController

  def index
    @filterrific = initialize_filterrific(
        Product,
        params[:filterrific],
        select_options: {
            sorted_by: Product.options_for_sorted_by,
            with_category_id: Category.options_for_select,
        },
        persistence_id: "shared_key",
        default_filter_params: {},
        available_filters: [:sorted_by, :with_category_id, :between_price],
        sanitize_params: true,
        ) || return
    @products = @filterrific.find.page(params[:page])

    # render json: @products
  end

  def product
    @product = Product.find(params[:id])
  end

end
