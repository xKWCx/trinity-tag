require 'rails_helper'

RSpec.describe ApplicationMailer, type: :mailer do
  it "has the correct default from address" do
    expect(described_class.default[:from]).to eq("from@example.com")
  end
end
