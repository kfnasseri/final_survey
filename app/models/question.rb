class Question < ActiveRecord::Base
  has_many :responses, dependent: :destroy
  belongs_to :survey
end
