class Autolinker
  module Regex extend self
    HANDLE = /(?:\s|^)(?:@)(\w+)/i

    HASHTAG = /(?:\s|^)(?:#(?!\d+(?:\s|$)))(\w+)(?=\s|$)/i
  end
end