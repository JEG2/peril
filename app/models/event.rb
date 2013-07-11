class Event < ActiveRecord::Base
  ####################
  ### Associations ###
  ####################

  belongs_to :game
  belongs_to :answer

  ###################
  ### Validations ###
  ###################

  validates :game_id,   presence: true
  validates :answer_id, presence: true, uniqueness: {scope: :type}

  ##############
  ### Scopes ###
  ##############

  scope :most_recent, -> { order("created_at DESC") }
end
