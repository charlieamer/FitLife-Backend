class User < ApplicationRecord
  has_secure_password
  has_one :user_preference
  validates :username, presence: true, uniqueness: true

  def as_json(options = {})
    super(except: [:password_digest])
  end
  
  def self.from_token_request request
    # Returns a valid user, `nil` or raise `Knock.not_found_exception_class_name`
    # e.g.
    username = request.params["auth"] && request.params["auth"]["username"]
    self.find_by username: username
  end
end
