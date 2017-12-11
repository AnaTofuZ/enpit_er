class User < ApplicationRecord

    has_one :profile
    has_one :item
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_SCREEN_NAME_REGEX = /\A[a-zA-Z]+\z/i
    validates :screen_name, presence: true, length: { maximum: 15 },
                      format: { with: VALID_SCREEN_NAME_REGEX },
                      uniqueness: { case_sensitive: false }

    has_secure_password
end
