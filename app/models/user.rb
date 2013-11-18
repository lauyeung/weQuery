class User < ActiveRecord::Base
  has_many :questions,
    inverse_of: :user

  has_many :votes  

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
    end
  end

  def github
    if provider == "github"
      @github ||= Github::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_secret)
    end
  end

  def anonymizer
    Anonymizer.new.generate_alias
  end

end
