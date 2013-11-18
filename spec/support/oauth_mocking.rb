module OauthMocking
  def login_with_oauth(provider = :github)
    visit "/auth/#{provider}/callback"
  end

  def admin_login_with_oauth(provider = :github)
    visit "/auth/#{provider}/callback"
    user = User.last
    user.admin = true
    user.save!
  end
end
