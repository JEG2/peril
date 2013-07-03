class Answer < ActiveRecord::Base
  ####################
  ### Associations ###
  ####################

  belongs_to   :category
  acts_as_list scope: :category

  ###################
  ### Validations ###
  ###################

  validates :body, :question, presence: true
end
