class ListPresenter
  # the presenter is tightly coupled to the types of items available
  VehicleItem = Struct.new(:make, :model, :photo_url, :vin)
  AdItem = Struct.new(:ad_id, :targeting)
  EndOfResultsItem = Struct.new(:cta)

  attr_accessor :list_items


  def initialize(list_items)
    @list_items = list_items
  end

  def present_item(index)
    item = @list_items[index]
    # to support new types of item, we need to change this method
    case item
    when VehicleItem
      { 
        title: "#{item[:make]} #{item[:model]}",
        image: { caption: "Image of #{item[:vin]}", url: item[:photo_url] },
      }
    when AdItem
      {
        title: "Our sponsor",
        image: { caption: AdsRepo.new.get_ad(item[:ad_id]).caption, url: "https://ads.autolist.com/image/#{item[:ad_id]}.png" }
      }
    when EndOfResultsItem
      {
        title: "That's it. Broaden your search terms for more listings",
        image: { caption: 'end of results', url: 'https://images.autolist.com/endofresults.png' }
      }
    else
      # we have to handle unexpected data explicitly
      raise "cannot present item: #{item}"
    end
  end

  def length
    @list_items.length
  end
end