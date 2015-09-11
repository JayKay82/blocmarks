require 'rails_helper'

RSpec.describe EmailToBookmark do
  context 'without existing user' do
    let(:email) { { url: 'http://www.apple.com/', topic: 'Tech', user: 'sample@example.com' } }
    subject(:bookmark) { EmailToBookmark.parse(email) }

    it 'returns a new instance of Bookmark' do
      expect(bookmark).to be_an_instance_of(Bookmark)
    end

    it 'creates a new user' do
      expect(bookmark.user.email).to eq(email[:user])
    end

    context 'with existing user' do
      let!(:user) { create(:user) }

      it 'returns a bookmark that belongs to that user' do
        expect(User.count).to eq(1)
        expect(bookmark.user.email).to eq(user.email)
      end

      it 'returns a bookmark with a newly created topic' do
        expect(bookmark.topic.title).to eq('Tech')
      end

      context 'with existing topic' do
        before { create(:topic, user: user) }

        it 'returns a bookmark with the existing topic' do
          expect(user.topics.count).to eq(1)
          expect(bookmark.topic.title).to eq('Tech')
        end
      end
    end
  end
end
