require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe 'Relationships' do
    it { should have_many :subscriptions }
    it { should have_many(:customers).through(:subscriptions) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
   
    it { should validate_numericality_of(:temperature).is_greater_than(0) }
    it { should validate_numericality_of(:brew_time).is_greater_than(0) }
  end
end
