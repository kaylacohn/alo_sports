class Player < ActiveRecord::Base
  has_attached_file :image, styles: { large: "600x600", medium: "300x300", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_attached_file :transcript
  validates_attachment :transcript, content_type: { content_type: %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  has_attached_file :sat_scores
  validates_attachment :sat_scores, content_type: { content_type: %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  belongs_to :user
end
