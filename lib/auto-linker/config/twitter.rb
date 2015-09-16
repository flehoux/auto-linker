class Autolinker
  module Config
    TWITTER = {
      :handle_class => "linked-url handle".freeze,
      :handle_url_base => "https://twitter.com/".freeze,

      :hashtag_class  => "linked-url hashtag".freeze,
      :hashtag_url_base  => "https://twitter.com/#!/search?q=%23".freeze,

      :url_class  => "linked-url url".freeze,

      :target => "_blank".freeze
    }.freeze
  end
end