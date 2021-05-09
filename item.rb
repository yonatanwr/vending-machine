class Item
  attr_accessor :id,:name,:price

  def initialize(param)
    param.each do |attr,val|
      instance_variable_set("@#{attr}", val) unless val.nil?
    end
  end

  def to_s
    "-- #{name.upcase} price:#{price_in_dollars} code:#{id}"
  end 

  def paying_display
    "you chose #{name.upcase} please pay #{price_in_dollars}"
  end

  def price_in_dollars  
    "$#{'%.2f' % (price/100.0)}"
  end
end  