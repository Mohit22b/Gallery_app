class Album < ApplicationRecord
  has_many_attached :images  
  has_one_attached :cover_image
  belongs_to :user  
  has_many :taggings , dependent: :destroy 
  has_many :tags, through: :taggings

  scope :unpublished_albums, -> {where(published:false)}
  scope :published_albums  , -> {where(published:true)}
  
  def self.tagged_with(name)
    Tag.find_by!(name: name).albums
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)  
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

end
  