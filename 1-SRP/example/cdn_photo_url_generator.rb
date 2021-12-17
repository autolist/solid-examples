require 'digest'

class CdnPhotoUrlGenerator
  def initialize(options)
    @options = options
  end

  def cdn_url(original_url)
    sig = Digest::SHA256.hexdigest(original_url + @options[:key])[0,8]
    "#{@options[:cdn_base]}#{original_url}?sig=#{sig}"
  end
end