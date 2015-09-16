class Autolinker
  module Regex extend self
    HANDLE = /\B@([\w]+)/i

    HASHTAG = /\B#([\w]+)/i
  end
end