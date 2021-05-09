require_relative 'command_line_listeners'
require_relative 'item_list'
require_relative 'coins_value'

class Machine
  STATE = {
    choose_item: "choose_item",
    pay: "pay"
  }

  attr_accessor :state , :balance , :item_list , :current_deposite , :current_item

  def initialize
    @state = STATE[:choose_item]
    @balance = CoinsValue.new
    @item_list = ItemList.new 
    @current_deposite = 0       
  end  

  def start
    print_to_user
  end

  def print_to_user
    @current_deposite = 0
    while true
      if state == STATE[:choose_item]
        choose_item_state
      elsif state == STATE[:pay]  
        pay_state
      end   
    end   
  end
  

  def print_balance
      p "total #{balance.value} coins: #{balance.inspect}" 
  end


  def choose_item_state
    machine_status_print
    puts "Please choose a product by entering its code"
    puts item_list.display_list
    product_id = CommandLineListener.listen()
    @current_item = item_list.find_by_id(product_id.to_i)
    puts current_item ? current_item.paying_display : "N/A" 
    if current_item
      current_item.paying_display
      @state = STATE[:pay]
    else
      puts "N/A"
    end
  end


  def pay_state
    if current_deposite  == 0
      puts "Please insert coins" 
    end
    amount = CommandLineListener.listen()
    coins_value = CoinsValue.build_coins_value(amount)
    @current_deposite = current_deposite + coins_value.value
    p current_deposite 
    if current_deposite < @current_item.price
      balance.add_coins(coins_value)
      machine_status_print
      change = (current_deposite - current_item.price) * -1
      puts "you deposited #{to_dollars(current_deposite)} missing #{to_dollars(change)}"
    elsif current_deposite == @current_item.price  
      balance.add_coins(coins_value)
      machine_status_print
      @current_deposite = 0
      @state = STATE[:choose_item]
      p "please take your product"
      sleep(3)
    else  current_deposite > current_item.price
      balance.add_coins(coins_value)
      machine_status_print
      @state = STATE[:choose_item]
      change = current_deposite - current_item.price
      p "please take your product and call support for change of #{to_dollars(change)}"
      @current_deposite = 0
      sleep(3)  
    end
  end

  def to_dollars(cents)
    "$#{'%.2f' % (cents/100.0)}"
  end 


  def machine_status_print
    puts "-------Machine Status---------------------"
    puts "Machine Total #{to_dollars(balance.value)}"    
    puts "Machine Coins #{balance.inspect}"   
    puts "------------------------------"
    puts ""
  end 
end  

def unit_test
  mc = Machine.new
  mc.start
end  
