require 'rails_helper'

RSpec.describe 'User can CRUD topics:', type: :request do
  include BlocmarkSteps

  feature 'I want to see a list of all Blocmark topics with its urls' do
    before do
      create_user
      create(:bookmark)
      user_signs_in
    end

    it 'shows me a list of my topics' do
      expect(page).to have_content('Topic - 1')
    end

    it 'displays a bookmark belonging to a topic' do
      within '#topic-1' do
        expect(page).to have_content('http://www.apple.com')
      end
    end

    feature 'I want to click on a topic title and see its show page' do

      it "lets me click on a topic title a visit its show page" do
        click_link('Topic - 1')
        expect(current_path).to eq('/topics/1')
      end

      it 'displays a list of related bookmarks on the show page of a topic' do
        visit '/topics/1'
        expect(page).to have_content('http://www.apple.com')
      end
    end
  end

  feature 'I want to create new topic' do
    before do
      create_user
      user_signs_in
    end

    it 'lets me click a link to go to a new topic form' do
      click_link 'Create Topic'
      expect(page).to have_content('New Topic')
    end

    it 'allows me to create a new topic' do
      visit new_topic_path
      within '.devise-form' do
        fill_in 'Title', with: 'Sample Topic'
        click_button 'Save'
      end
      expect(page).to have_content('Sample Topic')
    end

    feature 'I want to delete a topic' do

      it 'allows me to click a link to delete a topic' do
        user_creates_new_topic
        click_link 'delete'
        expect(page).not_to have_content('Sample Topic')
      end
    end
  end
end
