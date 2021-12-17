# dependency on digest
require 'digest'

class Vehicle
  # dependency on rails
  include ActionView::Helpers::NumberHelper

  # representation of data
  attr_accessor :vin
  attr_accessor :make
  attr_accessor :model
  attr_accessor :year
  attr_accessor :trim
  attr_accessor :price
  attr_accessor :photo_url

  def initialize(attrs)
    @vin = attrs[:vin]
    @make = attrs[:make]
    @model = attrs[:model]
    @year = attrs[:year]
    @trim = attrs[:trim]
    @price = attrs[:price]
    @photo_url = attrs[:photo_url]
  end

  # marketing, translation
  def marketing_title
    "Great #{@year} #{@make} #{@model} #{@trim} for sale for only #{humanized_price}!" 
  end

  # UX, presenation
  def vdp_title
    "#{@year} #{@make} #{@model}"
  end

  # UX, presentation
  def vdp_details
    {
      trim: @trim,
      price: @price,
      vin: @vin
    }
  end

  # CDN signing, interaction with the env
  def cdn_photo_url
    key = ENV['CDN_SIGNATURE_KEY']
    cdn_base = ENV['CDN_BASE_URL']
    sig = Digest::SHA256.hexdigest(@photo_url + key)[0,8]
    "#{cdn_base}#{@photo_url}?sig=#{sig}"
  end

  private

  # localization, presentation
  def humanized_price
    number_to_currency(@price)
  end
end


