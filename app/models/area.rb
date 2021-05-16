class Area < ApplicationRecord
    has_many  :visit_histories
    validates :ward, presence: true
    validates :city_block, presence: true
    validates :status, presence: true
end
