class Agency < ApplicationRecord
    has_many :advertisements, dependent: :destroy
end
