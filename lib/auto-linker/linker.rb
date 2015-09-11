class Autolinker
  attr_reader :config
  attr_reader :text

  #--
  # Class Methods
  #++

  # Top level method used to replace handles, hashtags, url and emails with clickable links.
  def self.parse(text, default_config = Config::INSTAGRAM, config = {})
    Autolinker.new(default_config, config).parse(text)
  end

  #--
  # Instance Methods
  #++

  # Merges the default_config and config together
  def initialize(default_config = Config::INSTAGRAM, config = {})
    @config = default_config.merge(config)
  end

  # Replaces handles, hashtags, url and emails with clickable links.
  def parse(text)
    return '' unless text
    
    @text = text
    replace_url
    replace_handle
    replace_email
    replace_hashtag
    @text
  end

  private
    # Replaces handles with clickable links
    def replace_handle
      @text.gsub!(Regex::HANDLE, '<a href="' << @config[:handle_url_base] << '\1" class="' << @config[:handle_class] <<  '" target="' << @config[:target] << '">@\1</a>')
    end

    # Replaces urls with clickable links
    def replace_url
      @text.gsub!(Regex::URL, '<a href="http://\1" class="' << @config[:url_class] << '" target="' << @config[:target] << '">\1</a>')
    end

    # Replaces emails with clickable links
    def replace_email
      @text.gsub!(Regex::EMAIL, '<a href="mailto:\1" class="' << @config[:email_class] << '" target="' << @config[:target] << '">\1</a>')
    end

    # Replaces hashtags with clickable links
    def replace_hashtag
      @text.gsub!(Regex::HASHTAG, '<a href="' << @config[:hashtag_url_base] << '\1" class="' << @config[:hashtag_class] << '" target="' << @config[:target] << '">#\1</a>')
    end
end