class Autolinker
  module Regex extend self
    HANDLE = /(?:\s|^)(?:@)(\w+)/i

    HASHTAG = /(?:\s|^)(?:#(?!\d+(?:\s|$)))(\w+)(?=\s|$)/i

    URL = /(?:https?:\/\/)?([\da-z\.-]+\.[a-z\.]{2,6}[\/\w \#\.-]*)+\/?/i

    EMAIL = /([a-z0-9_\.-]+@[\da-z\.-]+\.[a-z\.]{2,6})/i
  end
end