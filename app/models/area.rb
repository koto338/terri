class Area < ApplicationRecord
    has_many  :visit_histories
    belongs_to :user
    validates :ward, presence: true
    validates :town, presence: true
    validates :city_block, presence: true
    validates :status, presence: true
end
