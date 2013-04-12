cipher = <<ENDTEXT
g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj.
ENDTEXT

# Old
#def decipher(string)
#  string.split("").map{ |c| c =~ /[\s.']/ ? c : c.succ.succ[-1] }.join
#end

# Better ! Plus court et pas besoin de traiter les ponctuations comme espace, apostrophe, etc.
def decipher(string)
  string.tr('a-z', 'c-zab')
end

puts decipher(cipher)
puts
puts decipher("map")