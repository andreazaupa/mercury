class Mercury::Image < ActiveRecord::Base

  self.table_name = :mercury_images

  attr_accessible :image

  mount_uploader :image, Mercury::ImageUploader

  delegate :url, :to => :image

  def serializable_hash(options = nil)
    options ||= {}
    options[:methods] ||= []
    options[:methods] << :url
    super(options)
  end

end
