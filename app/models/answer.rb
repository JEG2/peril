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

  ########################
  ### Instance Methods ###
  ########################

  def viewed?
    viewed_at.present?
  end
end
