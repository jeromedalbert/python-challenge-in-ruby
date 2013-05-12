def decipher(string)
  string.tr('a-z', 'c-zab')
end

cipher = <<-EOS
g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp.
bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle.
sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj.
EOS

puts decipher(cipher)
puts
puts decipher('map')
