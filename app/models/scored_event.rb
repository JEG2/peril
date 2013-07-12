class ScoredEvent < Event
  ####################
  ### Associations ###
  ####################

  belongs_to :player

  ###################
  ### Validations ###
  ###################

  validates :player_id, presence: true

  #################
  ### Callbacks ###
  #################

  before_create  :apply
  before_destroy :undo

  def apply
    player.increment(:score, score).save
  end

  def undo
    if player && game && answer
      player.decrement(:score, score).save
    end
  end

  #######
  private
  #######

  def score
    game.reward_for(answer).score
  end
end
