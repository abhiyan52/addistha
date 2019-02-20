class Agency < ApplicationRecord
    has_many :advertisements, dependent: :destroy
    belongs_to :user, :foreign_key => "manager_id"
end
