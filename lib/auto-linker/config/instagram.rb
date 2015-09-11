class Autolinker
  module Config
    INSTAGRAM = {
      :handle_class => "linked-url handle".freeze,
      :hashtag_class  => "linked-url hashtag".freeze,
      :url_class  => "linked-url url".freeze,
      :email_class  => "linked-url email".freeze,

      :handle_url_base => "https://instagram.com/".freeze,
      :hashtag_url_base  => "https://instagram.com/explore/tags/".freeze,

      :target => "_blank".freeze
    }.freeze
  end
end