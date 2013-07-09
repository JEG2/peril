class Reward < ActiveRecord::Base
  ####################
  ### Associations ###
  ####################

  belongs_to   :game
  acts_as_list scope: :game

  ###################
  ### Validations ###
  ###################

  validates :score, presence:     true,
                    numericality: {only_integer: true, greater_than: 0}

  ########################
  ### Instance Methods ###
  ########################

  def to_param
    score
  end
end
