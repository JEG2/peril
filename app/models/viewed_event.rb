class ViewedEvent < Event
  #################
  ### Callbacks ###
  #################

  before_create  :apply
  before_destroy :undo

  def apply
    answer.update_attributes(viewed_at: Time.now)
  end

  def undo
    answer.try(:update_attributes, viewed_at: nil)
  end
end
