class User < ApplicationRecord

    has_one :profile
    has_many :item
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_NAME_REGEX = /\A\w+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }, if: -> { screen_name.blank?}
    validates  :screen_name, presence: true, length: { maximum: 15},
                     format: { with: VALID_NAME_REGEX},
                      uniqueness: { case_sensitive: false }, if: -> { email.blank?}
    has_secure_password
end
