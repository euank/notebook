class GovernmentCreature < ActiveRecord::Base
  belongs_to :user
  belongs_to :government
  belongs_to :creature
end
