require "readline"
class CommandLineListener
 
  def self.listen(prompt = nil)  
    addend_string = Readline.readline("#{prompt} \n >", true)
    return addend_string
  end


end

def unit_test
 CommandLineListener.listen("123")
 p "done" 
end