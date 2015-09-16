require 'minitest/autorun'
require 'auto-linker'

class ConfigTest < Minitest::Test
  # INSTAGRAM
  def test_default_instagram
    assert_equal "<a href=\"https://instagram.com/mention\" class=\"linked-url handle\" target=\"_blank\">@mention</a> <a href=\"https://instagram.com/explore/tags/hashtag\" class=\"linked-url hashtag\" target=\"_blank\">#hashtag</a>",
      Autolinker.parse('@mention #hashtag', Autolinker::Config::INSTAGRAM)
  end

  def test_instagram_custom_classes
    assert_equal "<a href=\"https://instagram.com/mention\" class=\"handle\" target=\"_blank\">@mention</a> <a href=\"https://instagram.com/explore/tags/hashtag\" class=\"hashtag\" target=\"_blank\">#hashtag</a>",
      Autolinker.parse('@mention #hashtag', Autolinker::Config::INSTAGRAM, {:handle_class => "handle", :hashtag_class => "hashtag"})
  end

  # TWITTER
  def test_default_twitter
    assert_equal "<a href=\"https://twitter.com/mention\" class=\"linked-url handle\" target=\"_blank\">@mention</a> <a href=\"https://twitter.com/#!/search?q=%23hashtag\" class=\"linked-url hashtag\" target=\"_blank\">#hashtag</a>",
      Autolinker.parse('@mention #hashtag', Autolinker::Config::TWITTER)
  end

  def test_twitter_custom_classes
    assert_equal "<a href=\"https://twitter.com/mention\" class=\"handle\" target=\"_blank\">@mention</a> <a href=\"https://twitter.com/#!/search?q=%23hashtag\" class=\"hashtag\" target=\"_blank\">#hashtag</a>",
      Autolinker.parse('@mention #hashtag', Autolinker::Config::TWITTER, {:handle_class => "handle", :hashtag_class => "hashtag"})
  end
end