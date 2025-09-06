require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe '#configure_permitted_parameters' do
    let(:devise_parameter_sanitizer) { double('devise_parameter_sanitizer') }

    before do
      allow(controller).to receive(:devise_parameter_sanitizer).and_return(devise_parameter_sanitizer)
    end

    it 'permits additional parameters for sign_up' do
      expect(devise_parameter_sanitizer).to receive(:permit).with(:sign_up, keys: [ :first_name, :last_name, :phone ])

      controller.send(:configure_permitted_parameters)
    end
  end
end
