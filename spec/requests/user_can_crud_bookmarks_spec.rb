require 'rails_helper'

RSpec.describe 'User can CRUD bookmarks:', type: :request do
  include BlocmarkSteps

  context 'As an authenticated user on a topic page' do

    feature 'I want to create a new bookmark' do
      before do
        create_user
        user_signs_in
        user_creates_new_topic
        visit topic_path(Topic.first)
      end

      it 'lets me click on a \'create bookmark\' link to go to a new form' do
        click_link 'Create Bookmark'
        expect(page).to have_content('New Bookmark')
      end

      it 'lets me fill out a form to create the new bookmark' do
        click_link 'Create Bookmark'
        within '.devise-form' do
          fill_in 'URL', with: 'http://www.mycoolsite.com/'
          click_on 'Save'
        end
        expect(page).to have_content('http://www.mycoolsite.com/')
      end
    end

  end
end
