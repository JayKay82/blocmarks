module BlocmarkSteps
  def create_user
    @user = build(:user)
    @user.skip_confirmation!
    @user.save!
  end

  def user_signs_in
    visit new_user_session_path
    within '.devise-form' do
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_on 'Sign In'
    end
  end

  def user_creates_new_topic
    visit new_topic_path
    within '.devise-form' do
      fill_in 'Title', with: 'Sample Topic'
      click_button 'Save'
    end
  end
end
