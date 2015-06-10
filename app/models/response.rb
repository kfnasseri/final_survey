class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates :answer, presence: true

  def survey
    @survey ||= question.survey
  end
end
