class User < ApplicationRecord

  before_save do
    self.username = username.downcase
  end

  validates :username,
            presence: true,
            length: {
              minimum: 3,
              maximum: 15
            },
            uniqueness: {
              case_sensitive: false
            }

  has_secure_password

  has_many :messages

end
