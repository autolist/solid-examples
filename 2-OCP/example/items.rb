# to add new items, simply add a new types that implements #present

VehicleItem = Struct.new(:make, :model, :photo_url, :vin) do 
  def present
    item = self
    { 
      title: "#{item[:make]} #{item[:model]}",
      image: { caption: "Image of #{item[:vin]}", url: item[:photo_url] },
    }
  end
end

AdItem = Struct.new(:ad_id, :targeting) do 
  def present
    item = self
    {
      title: "Our sponsor",
      image: { caption: AdsRepo.new.get_ad(item[:ad_id]).caption, url: "https://ads.autolist.com/image/#{item[:ad_id]}.png" }
    }
  end
end

EndOfResultsItem = Struct.new(:cta) do 
  def present
    {
      title: "That's it. Broaden your search terms for more listings",
      image: { caption: 'end of results', url: 'https://images.autolist.com/endofresults.png' }
    }
  end
end
