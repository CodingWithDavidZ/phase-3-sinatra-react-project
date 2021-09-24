class Employee < ActiveRecord::Base
  belongs_to :manager
end
