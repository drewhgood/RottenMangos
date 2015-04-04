class Movie < ActiveRecord::Base

  has_many :reviews

  mount_uploader :image, ImageUploader

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  # validates :poster_image_url,
  #   presence: true

  validates :release_date,
    presence: true

  # validate :release_date_is_in_the_future
  # do_not_validate_attachment_file_type :image

  def review_average
    if self.reviews.count > 0
      "#{self.reviews.average(:rating_out_of_ten).to_i}/10"
    else
      "No Reviews Yet"
    end

  end

  def self.search(query)
    # where("title like ? or director like ?", "%#{query}%", "%#{query}%") 
  end

  scope :by_title, -> title { where(title: title)}


  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end




end
