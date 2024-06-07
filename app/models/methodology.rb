class Methodology < ActiveRecord::Base

  belongs_to :user
  has_many :measurements

  validates :methodology_name, :presence => true

  default_scope -> { order('methodology_name ASC') }
  scope :filter_by_subclass, -> (subclass) { joins(measurements: [observation: :specie]).where(specie: {subclass: subclass}).distinct }

  searchable do
    text :methodology_name
    string :methodology_name_sortable do
      methodology_name
    end
  end

end
