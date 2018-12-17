class Content < ApplicationRecord
  has_many :user_content, dependent: :destroy
  has_many :users, through: :user_content, dependent: :destroy

  validates :title, presence: true
  validates :director, presence: true
  validates :year, presence: true
  validates :category, presence: true
  validates :file_path, presence: true

  def self.search(title, director, first_year, second_year, category)
    if first_year.blank?
      where("upper(title) LIKE upper(?) AND
             upper(director) LIKE upper(?) AND
             upper(year) LIKE upper(?) AND
             upper(category) LIKE upper(?)",
             "%#{title}%", "%#{director}%", "%#{second_year}%", "%#{category}%")
    elsif second_year.blank?
      where("upper(title) LIKE upper(?) AND
            upper(director) LIKE upper(?) AND
            upper(year) LIKE upper(?) AND
            upper(category) LIKE upper(?)",
            "%#{title}%", "%#{director}%", "%#{first_year}%", "%#{category}%")
    else
      where("upper(title) LIKE upper(?) AND
             upper(director) LIKE upper(?) AND
             upper(year) >= upper(?) AND upper(year) <= upper(?) AND
             upper(category) LIKE upper(?)",
             "%#{title}%", "%#{director}%", "#{first_year}", "#{second_year}",
             "%#{category}%")
    end
  end

  def create_content(content_params)
    unless content_params[:file_path].nil?
      upload = content_params[:file_path]
      File.open(Rails.root.join('public', 'uploads', upload.original_filename), 'wb') do |file|
        file.write(upload.read)
      end
      content_params[:file_path] = upload.original_filename
    end
    save(content_params)
  end

  def update_content(content_params)
    unless content_params[:file_path].nil?
      upload = content_params[:file_path]
      File.open(Rails.root.join('public', 'uploads', upload.original_filename), 'wb') do |file|
        file.write(upload.read)
      end
      content_params[:file_path] = upload.original_filename
    end
    update(content_params)
  end
end
