class Location < ActiveRecord::Base

  belongs_to :user
  has_many :observations, :dependent => :destroy

  validates :location_name, :presence => true
  validates :latitude, :presence => true
  validates :longitude, :presence => true

  default_scope -> { order('location_name ASC') }
  scope :filter_by_subclass, -> (subclass) { joins(observations: :specie).where(specie: {subclass: subclass}).distinct }

  searchable do
    text :location_name
    text :id
    string :location_name_sortable do
      location_name
    end
  end

end
