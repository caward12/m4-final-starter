require 'uri'

class Link < ActiveRecord::Base
  validates :url, presence: true
  validates :title, presence: true
  validate :validate_url
  belongs_to :user

  def valid_url?
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  end

  def validate_url
    errors.add(:url, 'Not a Valid URL') unless valid_url?
  end
end
