class Trade < ApplicationRecord
  belongs_to :user
  belongs_to :item
  enum trade_status: { exhibition: 0, exhibition_stop: 1, sold_out: 2}
end
