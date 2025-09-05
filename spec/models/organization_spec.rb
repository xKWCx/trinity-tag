require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'associations' do
    it { should have_one_attached(:logo) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }

    context 'address validations' do
      it { should validate_presence_of(:address) }
      it { should validate_presence_of(:city) }
      it { should validate_presence_of(:state) }
      it { should validate_presence_of(:zip) }
      it { should validate_presence_of(:country) }
    end
  end
end
