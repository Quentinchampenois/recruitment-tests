class Test
    # rot13 function cipher string param
    #param: string : String
    # returns ciphered : String
    def rot13(string)
        ciphered = String.new
        alphabet = 'abcdefghijklmnopqrstuvwxyz'

        # For each char in string, cipher if c is a letter, otherwise add the char
        string.each_char{ |c|
            if c =~ /[a-z]/  # https://stackoverflow.com/a/14551303/11018979 - regexp synthaxe
                ciphered << alphabet[(alphabet.index(c.downcase) + 13) % alphabet.length]
            elsif c =~ /[A-Z]/
              ciphered << alphabet[(alphabet.index(c.downcase) + 13) % alphabet.length].upcase
            else
                ciphered << c
            end
        }
        ciphered
    end
end
