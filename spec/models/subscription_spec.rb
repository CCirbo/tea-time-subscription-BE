require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'Relationships' do
    it { should belong_to :tea }
    it { should belong_to :customer }
    
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:frequency) }
    # it { should validate_presence_of(:price)}
    it { should validate_numericality_of(:price).is_greater_than(0) }
  end
end
