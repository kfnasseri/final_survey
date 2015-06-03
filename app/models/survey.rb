class Survey < ActiveRecord::Base
  has_many :questions
  belongs_to :admin, :class_name => "User", :foreign_key => "admin_id"
end
