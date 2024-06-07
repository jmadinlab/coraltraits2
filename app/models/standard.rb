class Standard < ActiveRecord::Base

  belongs_to :user
  has_many :measurements
  has_many :traits

  validates :standard_name, :presence => true
  validates :standard_class, :presence => true

  default_scope -> { order(standard_class: :asc, standard_name: :asc) }
  scope :filter_by_subclass, -> (subclass) { joins(measurements: [observation: :specie]).where(specie: {subclass: subclass}).distinct }

  searchable do
    text :standard_name
    text :standard_unit
    text :standard_class
    string :standard_name_sortable do
      standard_name
    end
    string :standard_class_sortable do
      standard_class
    end
  end

end
