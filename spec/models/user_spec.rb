require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'creates a confirmed user' do
    expect { User.create_confirmed_blocmark_user('sample@example.com') }.to change { User.count }.from(0).to(1)
  end
end
