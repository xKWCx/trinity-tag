require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should belong_to(:organization) }
  end

  describe 'validations' do
    subject { build(:user) }

    context 'for accepted users (no pending invitation)' do
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
      it { should validate_presence_of(:role) }
    end

    context 'for users with pending invitations' do
      let(:user) do
        build(:user,
              first_name: nil,
              last_name: nil,
              role: nil,
              invitation_sent_at: 1.day.ago,
              invitation_accepted_at: nil)
      end

      it 'requires first_name, last_name, and role even when invitation is pending' do
        expect(user).not_to be_valid
        expect(user.errors[:first_name]).to include("can't be blank")
        expect(user.errors[:last_name]).to include("can't be blank")
        expect(user.errors[:role]).to include("can't be blank")
      end

      it 'requires last_name when invitation is pending' do
        user.first_name = 'John'
        user.role = :user
        expect(user).not_to be_valid
        expect(user.errors[:last_name]).to include("can't be blank")
      end

      it 'requires role when invitation is pending' do
        user.first_name = 'John'
        user.last_name = 'Doe'
        expect(user).not_to be_valid
        expect(user.errors[:role]).to include("can't be blank")
      end

      it 'requires organization when invitation is pending' do
        user.first_name = 'John'
        user.last_name = 'Doe'
        user.role = :user
        user.organization = nil
        expect(user).not_to be_valid
        expect(user.errors[:organization]).to include('must exist')
      end
    end

    # Email validation is handled by Devise's :validatable module
    it 'validates email format' do
      user = build(:user, email: 'invalid-email')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include('is invalid')
    end

    it 'allows phone to be nil (optional field)' do
      user = build(:user, phone: nil)
      expect(user).to be_valid
    end

    it 'allows phone to be blank (optional field)' do
      user = build(:user, phone: '')
      expect(user).to be_valid
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

    # Password validation is handled by Devise's :validatable module
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

  describe 'enums' do
    it 'defines role enum' do
      expect(User.roles).to eq({ 'user' => 0, 'owner' => 1 })
    end

    it 'allows setting role with symbol' do
      user = build(:user, role: :owner)
      expect(user.role).to eq('owner')
      expect(user.owner?).to be true
    end

    it 'allows setting role with string' do
      user = build(:user, role: 'owner')
      expect(user.role).to eq('owner')
      expect(user.owner?).to be true
    end

    it 'defaults to user role when not specified' do
      user = User.new(first_name: 'Test', last_name: 'User', email: 'test@example.com')
      expect(user.role).to eq('user')
      expect(user.user?).to be true
    end

    it 'can be set to user role' do
      user = build(:user, role: :user)
      expect(user.role).to eq('user')
      expect(user.user?).to be true
    end
  end

  describe 'devise modules' do
    let(:user) { build(:user) }

    it 'includes database_authenticatable' do
      expect(user).to respond_to(:valid_password?)
    end

    it 'includes invitable' do
      expect(User).to respond_to(:invite!)
      expect(user).to respond_to(:invitation_token)
    end

    it 'includes lockable' do
      expect(user).to respond_to(:locked_at)
      expect(user).to respond_to(:unlock_access!)
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

    it 'includes timeoutable' do
      expect(user).to respond_to(:timeout_in)
    end

    it 'includes validatable' do
      expect(user).to respond_to(:email)
      expect(user).to respond_to(:password)
    end
  end
end
