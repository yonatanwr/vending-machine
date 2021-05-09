require 'yaml'
require_relative 'item'
class ItemList
  
  ITEMS_FILE = "data/item_list.yml"
  
  attr_accessor :list , :display_list
  
  def initialize
    @list = YAML.load(File.read(ITEMS_FILE))
    @display_list = create_list_for_display
  end  

  def create_list_for_display
    result = []
    list.keys.sort.each do |id|
      row_item = list[id]
      row_item[:id] = id
      item = Item.new(row_item)
      result << item
    end
    return result
  end

  def find_by_id(id)
    row_item = list[id]
    if row_item
      row_item[:id] = id
      item = Item.new(row_item)
    else
      nil
    end  
  end
end

def unit_test
  items = ItemList.new
  puts items.display_list
  item = items.find_by_id(2)
  puts item.paying_display
end  