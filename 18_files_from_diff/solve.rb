# Uses diff-lcs gem
require 'diff/lcs'

# Extend diff-lcs to take equal lines into account
module Diff::LCS
  class Diff::LCS::DiffCallbacks
    def match(event)
      @hunk << Diff::LCS::Change.new('=', event.old_position, event.old_element)
    end
  end
end


lines_left, lines_right = [], []
imgs_out = { '+' => '', '-' => '', '=' => '' }

File.open('deltas', 'r').each_line do |line|
  lines_left << line[0..52]
  lines_right << line[56..-2] # Must not take \n character !!! :-)
end

diffs = Diff::LCS.diff(lines_left, lines_right)

diffs.flatten.each do |diff|
  bytes = diff.element.split.map { |e| e.hex.chr }.join

  imgs_out[diff.action] << bytes
end

imgs_out.each do |key, content|
  File.open("#{key}_out.png", 'w') { |file| file.write(content) }
end
