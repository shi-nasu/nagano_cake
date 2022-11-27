class Item < ApplicationRecord
  has_many :order_details
  has_many :cart_items
  belongs_to :genre
  has_one_attached :image

  def get_profile_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
