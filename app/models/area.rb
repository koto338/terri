class Area < ApplicationRecord
    has_many  :visit_histories
    belongs_to :user
    validates :ward, presence: true
    validates :town, presence: true
    validates :city_block, presence: true
    validates :status, presence: true

    scope :search_areas, ->(params) do
      find_by_sql([<<-SQL, "%#{params}%", "%#{params}%"])
        SELECT
          *
        FROM
          areas
        WHERE
          ward LIKE ?
          OR town LIKE ?
        SQL
    end
end
