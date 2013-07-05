class Game < ActiveRecord::Base
  #################
  ### Behaviors ###
  #################

  prepend NamedSlug

  ####################
  ### Associations ###
  ####################

  has_many :categories, -> { order(:position) }, dependent: :destroy
end
