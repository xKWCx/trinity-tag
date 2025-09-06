require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should belong_to(:organization) }
  end

  describe 'validations' do
    subject { build(:user) }

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:phone) }

    it 'validates email format' do
      user = build(:user, email: 'invalid-email')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include('is invalid')
    end

    it 'accepts valid phone number formats' do
      valid_phones = [
        '1234567890',
        '+1 123 456 7890',
        '(123) 456-7890',
        '+44 20 7946 0958',
        '123-456-7890'
      ]

      valid_phones.each do |phone|
        user = build(:user, phone: phone)
        expect(user).to be_valid, "Expected #{phone} to be valid"
      end
    end

    it 'rejects invalid phone number formats' do
      invalid_phones = [
        '123',
        'abc123456',
        '123-45',
        '++1234567890',
        '123456789012345678'
      ]

      invalid_phones.each do |phone|
        user = build(:user, phone: phone)
        expect(user).not_to be_valid, "Expected #{phone} to be invalid"
        expect(user.errors[:phone]).to include('must be a valid phone number')
      end
    end

    it 'requires a minimum password length of 8 characters' do
      user = build(:user, password: '1234567', password_confirmation: '1234567')
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include('is too short (minimum is 8 characters)')
    end

    it 'requires password confirmation to match' do
      user = build(:user, password: 'password123', password_confirmation: 'different')
      expect(user).not_to be_valid
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end

  describe 'devise modules' do
    let(:user) { build(:user) }

    it 'includes database_authenticatable' do
      expect(user).to respond_to(:valid_password?)
    end

    it 'includes registerable' do
      expect(User).to respond_to(:new_with_session)
    end

    it 'includes recoverable' do
      expect(user).to respond_to(:send_reset_password_instructions)
    end

    it 'includes rememberable' do
      expect(user).to respond_to(:remember_me!)
    end

    it 'includes trackable' do
      expect(user).to respond_to(:current_sign_in_at)
      expect(user).to respond_to(:sign_in_count)
    end

    it 'includes confirmable' do
      expect(user).to respond_to(:confirmed?)
      expect(user).to respond_to(:send_confirmation_instructions)
    end

    it 'includes timeoutable' do
      expect(user).to respond_to(:timeout_in)
    end
  end
end
