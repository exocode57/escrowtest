class Stuff < ApplicationRecord
    belongs_to :admin, optional: true
    has_many :payments
end
