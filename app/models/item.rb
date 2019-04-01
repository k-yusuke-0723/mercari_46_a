class Item < ApplicationRecord
    belongs_to :user
    has_one :image, dependent: :destroy
end
