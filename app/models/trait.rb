class Trait < ActiveRecord::Base
  belongs_to :standard
  belongs_to :user
  belongs_to :traitclass

  has_many :measurements
  validates :trait_name, :presence => true
  validates :trait_name, :uniqueness => true
  validates :standard_id, :presence => true

  has_many :traitvalues, :dependent => :destroy

  # has_and_belongs_to_many :methodologies, :dependent => :destroy
  # accepts_nested_attributes_for :methodologies, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :traitvalues, :reject_if => :all_blank, :allow_destroy => true

  default_scope -> { includes(:traitclass).order('traitclasses.class_name ASC, trait_name ASC') }

  scope :editor, lambda {|ed| where("user_id = ?", ed)}
  scope :filter_by_taxa, -> (taxa) { joins(measurements: [observation: :specie]).where(specie: {subclass: taxa}).distinct }
  # scope :filter_by_traitclass, -> (class_name) { all.where(traitclass: {class_name: class_name}) }


  searchable do
    text :trait_name
    boolean :hide
    string :trait_name_sortable do
      trait_name
    end
  end


end


    # <% @traits.sort_by{ |h| [Traitclass.all.where(:id => h.traitclass_id).map(&:class_name) || "z", h.trait_name] }.each do |trait| %>
