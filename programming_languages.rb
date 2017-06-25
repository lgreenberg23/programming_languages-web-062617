
=begin
def reformat_languages(languages)
  new_hash = {}
  lang_style = []
  #this line gets style key and hash for the list of languagues
  languages.each do |oo_or_functional, language_list_hash|
    #this loop creates a new key for each languague and includes it and the
    #info hash into the new hash
    language_list_hash.each do |lang_name, info_hash|
      new_hash[lang_name] = info_hash
      #this loop assigns a style to the info part of each language in new_hash
      new_hash.each do |language_name, info_about_hash|
        if lang_name == language_name
          #this is where the issue is - want to use << to put multiple styles
          #into the array but can only figure out how to do all or 1
          #not sure what the right "if" statement or assignment is to get it to
          #only assign the style for that language and to see if the language
          #occurs 2x
          lang_style = oo_or_functional
          new_hash[language_name][:style] = [lang_style]
        end
      end
    end
  end
  new_hash
end
=end

#output.each do |item|
# output_hash[item.name] = []
#end

def reformat_languages(languages)
  new_hash = {}
  lang_style = []
  hash_oo = {}
  hash_funct = {}
  languages.each do |oo_or_functional, language_list_hash|
    if oo_or_functional.to_s == "oo"
      hash_oo = language_list_hash
      hash_oo.each do |lang_name, info_hash|
        hash_oo[lang_name][:style] = [:oo]
      end
    else
      hash_funct = language_list_hash
      hash_funct.each do |lang_name, info_hash|
        hash_funct[lang_name][:style] = [:functional]
        #now trying to get the arrays to merge
        info_hash.each do |type_or_style, value|
          if type_or_style.to_s == "style"
            #below line doesnt work
          #  hash_funct[lang_name][type_or_style] << hash_oo[lang_name][#ahhh problem]
            if lang_name.to_s == "javascript"
              hash_funct[lang_name][type_or_style] << :oo
            end
          end
        end
      end

    end
  end
  new_hash = hash_oo.merge(hash_funct) #{ |lang_key, info_hash|}
  new_hash
end
