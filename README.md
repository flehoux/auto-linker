auto-linker
-----------
Automatically replace mentions, hashtags, urls and emails with links for multiple services (twitter, instagram, facebook, ...)


Installation
-------------

```
gem install auto-linker
```

Quick Start
-----------

```ruby
require 'auto-linker'

# Replaces handles, hashtags, url and emails with clickable links.
# Replace using the Instagram base config
Autolinker.parse(text, Autolinker::Config::INSTAGRAM)

# Replace using the Twitter base config
Autolinker.parse(text, Autolinker::Config::TWITTER)
```

Example
-------

```
# Input text
text = '@flehoux This is a sample #autolinker www.lehoux.me'

# Usage
Autolinker.parse(text, Autolinker::Config::INSTAGRAM)

# Outputted result
=> "<a href="https://instagram.com/flehoux" class="linked-url handle" target="_blank">@flehoux</a> This is a sample <a href="https://instagram.com/explore/tags/autolinker" class="linked-url hashtag" target="_blank">#autolinker</a> <a href="http://www.lehoux.me" class="linked-url url" target="_blank">www.lehoux.me</a>"
```

Custom Configuration
--------------------

It's possible to overwrite the default_config attributes by passing a hash as the third parameter

```
Autolinker.parse(text, Autolinker::Config::INSTAGRAM, {
  :handle_class => "instagram-url handle",
  :hashtag_class  => "instagram-url hashtag"
})
```

### Available Attributes

* :handle_class (String)
* :hashtag_class (String)
* :url_class (String)
* :email_class (String)
* :handle_url_base (String)
* :hashtag_url_base (String)
* :target (String)
