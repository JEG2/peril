class Game < ActiveRecord::Base
  #################
  ### Behaviors ###
  #################

  prepend NamedSlug

  ####################
  ### Associations ###
  ####################

  has_many :rewards,    -> { order(:position) }, dependent: :destroy
  has_many :categories, -> { order(:position) }, dependent: :destroy

  ###################
  ### Validations ###
  ###################

  validate :rewards_cover_answers

  def rewards_cover_answers
    max = rewards.size
    categories.each do |category|
      if category.answers.size > max
        errors.add(:categories, "have more answers than the rewards cover")
        break
      end
    end
  end
  private :rewards_cover_answers
end
