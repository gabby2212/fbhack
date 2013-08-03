class Debt < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :lender, class_name: 'User'
  belongs_to :borrower, class_name: 'User'
  has_and_belongs_to_many :groups 

end
