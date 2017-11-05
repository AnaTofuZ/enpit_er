class Profile < ApplicationRecord
  belongs_to :user
  enum sex:{female: 0,male: 1}
end
