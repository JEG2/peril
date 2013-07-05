class Category < ActiveRecord::Base
  #################
  ### Behaviors ###
  #################

  prepend NamedSlug

  ####################
  ### Associations ###
  ####################

  belongs_to   :game
  acts_as_list scope: :game
  has_many     :answers, -> { order(:position) }, dependent: :destroy
end
