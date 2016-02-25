class Photo < ActiveRecord::Base
  dragonfly_accessor :image do
    after_assign do |img|
      img.encode!('jpg', '-quality 80') if img.image?
    end
  end

  validates :title, presence: true
  validates :image, presence: true

  validates :image, presence: true
  validates_size_of :image, maximum: 500.kilobytes, message: "It is too big, kya!!"
  validates_property :format, of: :image, in: [:jpeg, :jpg, :png, :bmp], message: "It's not my type",
                      case_sensitive: false
end
