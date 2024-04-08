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

  scope :editor, lambda {|ed| where("user_id = ?", ed)}


  searchable do
    text :trait_name
    boolean :hide
    string :trait_name_sortable do
      trait_name
    end
  end


end
