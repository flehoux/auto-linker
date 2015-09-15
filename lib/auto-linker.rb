require "rinku"

%w(
  config/instagram
  config/twitter
  linker
  regex
).each do |name|
  require "auto-linker/#{name}"
end