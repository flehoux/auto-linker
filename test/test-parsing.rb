require 'minitest/autorun'
require 'auto-linker'

class ParsingTest < Minitest::Test
  # HANDLES
  def test_single_handle
    assert_equal "<a href=\"https://instagram.com/test\" class=\"linked-url handle\" target=\"_blank\">@test</a>",
      Autolinker.parse('@test')
  end

  def test_two_spaceless_handles
    assert_equal "<a href=\"https://instagram.com/one\" class=\"linked-url handle\" target=\"_blank\">@one</a>@two",
      Autolinker.parse('@one@two')
  end

  # HASHTAGS
  def test_single_hashtag
    assert_equal "<a href=\"https://instagram.com/explore/tags/test\" class=\"linked-url hashtag\" target=\"_blank\">#test</a>",
      Autolinker.parse('#test')
  end

  def test_two_spaceless_hashtags
    assert_equal "<a href=\"https://instagram.com/explore/tags/one\" class=\"linked-url hashtag\" target=\"_blank\">#one</a>#two",
      Autolinker.parse('#one#two')
  end

  # URLS
  def test_single_http_url
    assert_equal "<a href=\"http://www.test.com\" class=\"linked-url url\" target=\"_blank\">http://www.test.com</a>",
      Autolinker.parse('http://www.test.com')
  end

  def test_single_https_url
    assert_equal "<a href=\"https://www.test.com\" class=\"linked-url url\" target=\"_blank\">https://www.test.com</a>",
      Autolinker.parse('https://www.test.com')
  end

  def test_single_www_url
    assert_equal "<a href=\"http://www.test.com\" class=\"linked-url url\" target=\"_blank\">www.test.com</a>",
      Autolinker.parse('www.test.com')
  end

  # EMAILS
  def test_single_email
    assert_equal "<a href=\"mailto:test@thisistest.com\" class=\"linked-url url\" target=\"_blank\">test@thisistest.com</a>",
      Autolinker.parse('test@thisistest.com')
  end

  # MIXED
  def test_twitter_mentions_with_hashtag
    assert_equal "RT <a href=\"https://twitter.com/VincentSeguin\" class=\"linked-url handle\" target=\"_blank\">@VincentSeguin</a>: Check out <a href=\"https://twitter.com/Coveo\" class=\"linked-url handle\" target=\"_blank\">@Coveo</a>'s <a href=\"https://twitter.com/#!/search?q=%23DF15\" class=\"linked-url hashtag\" target=\"_blank\">#DF15</a> Session Explorer, entirely made in <a href=\"https://twitter.com/#!/search?q=%23React\" class=\"linked-url hashtag\" target=\"_blank\">#React</a> <a href=\"https://twitter.com/#!/search?q=%23Js\" class=\"linked-url hashtag\" target=\"_blank\">#Js</a>! Congrats guys for the work! <a href=\"https://twitter.com/#!/search?q=%23Salesforce\" class=\"linked-url hashtag\" target=\"_blank\">#Salesforce</a>",
      Autolinker.parse('RT @VincentSeguin: Check out @Coveo\'s #DF15 Session Explorer, entirely made in #React #Js! Congrats guys for the work! #Salesforce', Autolinker::Config::TWITTER)
  end

  def test_twitter_mention_with_url
    assert_equal "<a href=\"https://twitter.com/m0E_tv\" class=\"linked-url handle\" target=\"_blank\">@m0E_tv</a> <a href=\"http://t.co/b7dyvQNl9I\" class=\"linked-url url\" target=\"_blank\">http://t.co/b7dyvQNl9I</a>",
      Autolinker.parse('@m0E_tv http://t.co/b7dyvQNl9I', Autolinker::Config::TWITTER)
  end
end