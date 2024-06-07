class Resource < ActiveRecord::Base

  belongs_to :user
  has_many :observations, :dependent => :destroy

  validates_uniqueness_of :doi_isbn, :allow_blank => true
  validate :check_consistency

  # default_scope -> { order('author ASC') }

  VALID_DOI_REGEX = /\b(10[.][0-9]{4,}(?:[.][0-9]+)*\/(?:(?!["&\'<>])\S)+)\b/
  validates :doi_isbn, format: { with: VALID_DOI_REGEX }, :allow_blank => true

  default_scope -> { order(author: :asc) }
  scope :filter_by_subclass, -> (subclass) { joins(observations: :specie).where(specie: {subclass: subclass}).distinct }

  searchable do
    text :author

    string :author_sortable do
      author
    end

    integer :count_sortable do
      observations.where(:access => true).size
    end

    text :doi_isbn
    text :title
    text :year
    text :journal
  end

  private

  def check_consistency
    errors.add(:base, 'Enter either doi or author and title') if ((author.blank? | title.blank?) & doi_isbn.blank?)
  end

end
