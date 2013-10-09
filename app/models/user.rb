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
      adjectives = [
      "boiling", "hidden", "bitter", "misty", "loquacious", "empty", "dry", "dark",
      "rick-rolled", "icy", "cryptic", "quiet", "caffeinated", "cool", "radiant", "electric",
      "patient", "superfluous", "dawn", "crimson", "furious", "dry", "blue",
      "billowing", "broken", "cold", "bearded", "falling", "frosty", "green",
      "long", "late", "lingering", "bold", "little", "morning", "muddy", "blazing",
      "red", "rough", "feisty", "small", "sparkling", "throbbing", "shy",
      "wandering", "emo", "wild", "black", "screaming", "falling", "solitary",
      "fragrant", "shielded", "snowy", "proud", "agile", "twerking", "thirsty",
      "Vulcan", "ancient", "green", "lively", "nameless"
    ]

    nouns = [
      "waterfall", "river", "breeze", "ninja", "wizard", "rain", "sea", "astronaut",
      "Weasley", "yeti", "sunset", "pine", "shadow", "leaf", "dawn", "shoes", "tribble",
      "forest", "harbor", "cloud", "jedi", "sandwich", "glade", "eagles", "brook",
      "butterfly", "ocean", "dew", "kitten", "dumpling", "fire", "launcher", "firefly",
      "feather", "REDBULL", "haze", "mountain", "night", "elf", "darkness",
      "fjord", "silence", "reef", "hobbit", "shape", "surf", "thunder",
      "citadel", "water", "shwag", "dragon", "water", "resonance", "sword",
      "wood", "bayou", "cherry", "tree", "MajorTom", "frost", "crocodile", "octocat",
      "frog", "fox", "canyon"
    ]

    "#{adjectives.sample}-#{nouns.sample}-#{rand(1000-9999)}"
  end

end
