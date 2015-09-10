class Tour < ActiveRecord::Base
	has_many :reviews
	belongs_to :category
	belongs_to :user
	validates :judul, presence: true, length: {minimum: 5}
  	validates :latitude, presence: true
  	validates :longitude, presence: true
  	validates :konten, presence: true
  	validates :category_id, presence: true
  	require 'carrierwave/orm/activerecord'
  	mount_uploader :gambar, GambarUploader
end
