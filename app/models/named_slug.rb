module NamedSlug
  def self.prepended(model)
    model.class_eval do
      ###################
      ### Validations ###
      ###################

      validates :name, :slug, presence: true, uniqueness: true
    end
  end

  ########################
  ### Instance Methods ###
  ########################

  def name=(new_name)
    super
    build_slug
  end

  def to_param
    slug
  end

  #######
  private
  #######

  def build_slug
    self.slug = name.to_s
                    .downcase
                    .tr("^a-z0-9", "-")
                    .sub(/\A-+/,   "")
                    .sub(/-+\z/,   "")
                    .gsub(/-{2,}/, "-")
  end
end
