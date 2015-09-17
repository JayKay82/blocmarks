require 'rails_helper'

RSpec.describe 'User can CRUD bookmarks:', type: :request do
  include BlocmarkSteps

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

    feature 'I want to update a bookmark' do
      before { user_creates_bookmark }
      it 'lets me click on a \'update\' link to go to an update form' do
        click_link 'update'
        expect(page).to have_content('Update Bookmark')
      end

      it 'lets me fill out a form to update the bookmark' do
        click_link 'update'
        within '.devise-form' do
          fill_in 'URL', with: 'http://www.myevencoolersite.com/'
          click_on 'Save'
        end
        expect(page).to have_content('http://www.myevencoolersite.com/')
      end

      feature 'I want to delete a bookmark' do
        it 'lets me click a \'delete\' link to destroy a bookmark ' do
          click_link 'delete'
          expect(page).to_not have_content('http://www.myevencoolersite.com/')
        end
      end
    end
  end
end
