class ListPresenter
  attr_accessor :list_items

  def initialize(list_items)
    @list_items = list_items
  end

  def present_item(index)
    # this method doesnt need to be changed to support new types
    # we dont have to handle unexpected types, as long as they conform to the interface
    # here the interface is implicit, but in a typed language, our items would implement a static interface
    @list_items[index].present
  end

  def length
    @list_items.length
  end
end