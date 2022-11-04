# Cipher Challenge

# Release 1 : Comment the code
# Write your comments on what each thing is doing.
# If you have difficulty, go into IRB and play with the methods.
=begin
def decoded_cipher(coded_message)
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the Ruby docs.
  decoded_sentence = []
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
            "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
            "g" => "c",
            "h" => "d",
            "i" => "e",
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}

  input.each do |x| # What is #each doing here?
    found_match = false  # Why would this be assigned to false from the outset? What happens when it's true?
    cipher.each_key do |y| # What is #each_key doing here?
      if x == y  # What is this comparing? Where is it getting x? Where is it getting y? What are those variables really?
        decoded_sentence << cipher[y]
        found_match = true
        break  # Why is it breaking here?
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing?
        decoded_sentence << " "
        found_match = true
        break
      elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do?
        decoded_sentence << x
        found_match = true
        break
      end
    end
    if not found_match  # What is this looking for?
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("")

  return decoded_sentence # What is this returning?
end

=end



# Release 3: Refactor the initial solution

def decoded_cipher(string, shift_amount)

  cipher = {}
  unaltered = ("a".."z").to_a
  decoded_array = []
  c = 0

  #creates the hash called cipher with all the keys having the indicatied shift performed

  cypher_shift(shift_amount).each do |x|
    cipher.store(x , unaltered[c] )

    c += 1

  end 



  string.split('').each do |x|
    if(/[[:alpha:]]/.match(x))


      decoded_array << cipher[x]
      
    end

    if( x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" )
      decoded_array << " "

      
  end

    if(/[[:digit:]]/.match(x))
      decoded_array << x

      
    end
  end
   decoded_array.join

end




def cypher_shift(shift_amount)
  alphabet = ("a".."z").to_a
  shift_amount.times{alphabet << alphabet.shift}

  return alphabet

end


puts "Decoding messages..."
puts decoded_cipher("fi%wyvi%xs^hvmro^csyv#szepxmri", 4)
puts decoded_cipher("asa,&csy^qywx#lezi^er@eajyp^psx$sj%jvii#xmqi&sr#csyv*lerhw!", 4)
puts decoded_cipher("xs*amr@xli%keqi,#csy@qywx#ompp&qi,&nslr#vsqivs.", 4)
puts decoded_cipher("izivcfshc*ks@xs*gsppiki,#wxyhc*levh,%wxyhc#levh.", 4)
puts decoded_cipher("ai@mrxirh^xs%fikmr&sr*xli&jmvwx^sj^jifvyevc@yrviwxvmgxih&wyfqevmri%aevjevi.", 4)


# DRIVER TESTS GO BELOW THIS LINE
#puts "Running tests for `decoded_cipher`..."
#puts decoded_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver test code and should print true

# Release 2: Write additional tests
# Create more driver test code based on the decoded messages. Driver test code statements should always return "true."







puts "Finished running tests."
