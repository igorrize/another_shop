class Product < ApplicationRecord
  has_and_belongs_to_many :categories


  filterrific(
      default_filter_params: { sorted_by: "created_at desc" },
      available_filters: [
          :sorted_by,
          :between_price,
          :with_category_id,
      ],
      )

  scope :with_category_id, lambda { |category_id|
    where(category_id: category_id)
  }
  scope :between_price, lambda { |price_range|
    from_price, to_price = price_range.split(' - ')
    where("price >= ? AND price <= ?", from_price, to_price)
  }
  scope :sorted_by, lambda { |sort_key|
    order(sort_key)
  }
  def self.options_for_sorted_by
    [
        ["Name (a-z)", "name_asc"],
        ["Added date (newest first)", "created_at desc"],
        ["Added date (oldest first)", "created_at asc"],
        ["Category (a-z)", "category_name_asc"],
    ]
  end

end
