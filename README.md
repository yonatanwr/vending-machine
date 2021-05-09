# Vending Machine
small vending machine project 
### Run it
 ````
 $ git clone https://github.com/yonatanwr/vending-machine.git
 $ cd vending-machine
 $ ruby -e ruby -r ./machine.rb  -e "unit_test"
 ````
You will see output in your Terminal window

````
-------Machine Status---------------------
Machine Total $0.00
Machine Coins #<CoinsValue:0x000055a4015df4a8 @quarter=0, @half=0, @one=0, @two=0, @three=0, @five=0>
------------------------------

Please choose a product by entering its code
-- APPLE price:$10.00 code:1
-- BANANA price:$10.00 code:2
-- WATER price:$7.00 code:3
-- ORANGE price:$17.00 code:4
````

On top part you will see the Vending Machine status
**Machine Total** - The total amout that was deposit
**Machine Coins** - The coins split

Please choose a product and press (4) and press enter
 
```
 >4
you chose ORANGE please pay $17.00
Please insert coins
>
````

Please enter coins in this format **coin-type** * **amount** sparte with "," .
**example**  0.5 * 2 , 0.25 * 4 ,1 * 10 => 
 - 2 coins of half dollar
 - 4 coins of quarter
 - 10 coins of 1 dollar 
(press enter)

````
 > 0.5 * 2 , 0.25 * 4 ,1 * 10

-------Machine Status---------------------
Machine Total $12.00
Machine Coins #<CoinsValue:0x000055a4015df4a8 @quarter=4, @half=2, @one=10, @two=0, @three=0, @five=0>
------------------------------

you deposited $12.00 missing $5.00

````

you can put deposit more coins if need 

````
you deposited $12.00 missing $5.00
 
 >  5 * 1,  3 * 2 ,2 * 3 

-------Machine Status---------------------
Machine Total $29.00
Machine Coins #<CoinsValue:0x000055a4015df4a8 @quarter=4, @half=2, @one=10, @two=3, @three=2, @five=1>
------------------------------

please take your product and call support for change of $12.00

````

### TODO

1. Calculate the bets option for change see [coin-change](https://github.com/nelsonic/coin-change-ruby)
2. Input validation.
3. Adding RSpec.



