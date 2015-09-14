require 'rails_helper'

RSpec.describe Topic, :type => :model do
  it { should belong_to :user }
  it { should have_many :bookmarks }
  it { should validate_length_of :title }
  it { should validate_uniqueness_of :title }
end
