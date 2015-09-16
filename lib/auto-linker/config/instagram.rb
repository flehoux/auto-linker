class Autolinker
  module Config
    INSTAGRAM = {
      :handle_class => "linked-url handle".freeze,
      :handle_url_base => "https://instagram.com/".freeze,

      :hashtag_class  => "linked-url hashtag".freeze,
      :hashtag_url_base  => "https://instagram.com/explore/tags/".freeze,

      :url_class  => "linked-url url".freeze,

      :target => "_blank".freeze
    }.freeze
  end
end