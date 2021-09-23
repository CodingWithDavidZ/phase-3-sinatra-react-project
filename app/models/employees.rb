class Employees < ActiveRecord::Base
  belongs_to :managers
end
