class Subscription < ApplicationRecord
    belongs_to :tea
    belongs_to :customer

    validates :title, :status, :frequency, presence: true
    validates :price , numericality: { greater_than: 0 }
end
