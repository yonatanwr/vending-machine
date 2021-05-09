class CoinsValue
   
  attr_accessor  :quarter ,:half , :one , :two , :three ,:five


  COINS_VALUE = {
    quarter: 25,
    half: 50,
    one: 100,
    two: 200,
    three: 300,
    five: 500,
  }.freeze

  COINS_DISPLAY = {
    quarter: "0.25",
    half: "0.5",
    one: "1",
    two: "2",
    three: "3",
    five: "5",
  }.freeze


  def initialize(hash_values = {})
    COINS_VALUE.keys.each do |type|
      val = hash_values.fetch(type,0)
      instance_variable_set("@#{type}", val) 
    end    
  end  

  def value
 
    quarter * COINS_VALUE[:quarter] + half * COINS_VALUE[:half] + 
      + one * COINS_VALUE[:one] + two * COINS_VALUE[:two] + 
      three * COINS_VALUE[:three] + five * COINS_VALUE[:five]
  end 

  # coin * count, coin * count , coin * count 
  # 0.1 * 3 , 0.5 * 2 , 2 * 4
  def self.build_coins_value(input)
    coin_value = {}
    coin_array = input.split(",")
    coin_array.each do |coin_n_amout_s|   
      coin_n_amout_array = coin_n_amout_s.split("*").map(&:strip)
      coin_s = coin_n_amout_array[0].strip
      coin = COINS_DISPLAY.key(coin_s)
      amout =  coin_n_amout_array[1].strip.to_i
      coin_value[coin] = amout
    end
    CoinsValue.new(coin_value)
  end 


  def add_coins(to_add)
    COINS_VALUE.each do |key,value|
      instance_variable_set("@#{key}",send(key) + to_add.send(key)) 
    end
  end


  def sub_coins(to_sub)
    COINS_VALUE.each do |key,value|
      temp_val = send(key) - to_sub.send(key)
      if temp_val < 0
        raise "dont have coins"
      end 
      instance_variable_set("@#{key}", temp_val) 
    end
  end 

  def show_coins_value
    puts self.inspect
  end  

end

def unit_test
  input_base = "0.5 * 2 , 0.25 * 4 ,1 * 10"
  coin_base = CoinsValue.build_coins_value(input_base)
  p coin_base.inspect 
  puts coin_base.value
  # input_to_add = "1 * 3 , 0.5 * 1 , 2 * 4"
  # coin_to_add = CoinsValue.build_coins_value(input_to_add)
  # coin_base.add_coins(coin_to_add)
  # puts coin_base.show_coins_value
  # puts coin_base.value
end  