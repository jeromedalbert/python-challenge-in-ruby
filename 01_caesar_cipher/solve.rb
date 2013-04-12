cipher = <<-EOS
g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp.
bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle.
sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj.
EOS

# Old
#def decipher(string)
#  string.split("").map{ |c| c =~ /[\s.']/ ? c : c.succ.succ[-1] }.join
#end

# Better ! Shorter and no need to handle punctuations, spaces, etc.
def decipher(string)
  string.tr('a-z', 'c-zab')
end

puts decipher(cipher)
puts
puts decipher("map")