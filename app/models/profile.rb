class Profile < ApplicationRecord
  belongs_to :user
  enum sex_id:{female: 0,male: 1}
end
