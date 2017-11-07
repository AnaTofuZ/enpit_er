class Profile < ApplicationRecord
  belongs_to :user
  enum sex:{notknown: 0,male: 1,female: 2,notapplicable: 9}
end
