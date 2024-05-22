require_relative 'app'
require 'spec_helper'

RSpec.describe User do
  describe 'validations' do
    it 'requires a name' do
      user = User.new(email: 'john@example.com')
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end
  end

  describe 'callbacks' do
    it 'sets the status to active before saving' do
      user = User.new(name: 'John Doe', email: 'john@example.com')
      expect(user.status).to be_nil
      user.save
      expect(user.status).to eq('active')
    end
  end

  # Add more tests as needed
end
