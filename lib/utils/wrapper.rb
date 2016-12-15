class Wrapper
  def initialize(url)
    agent = Mechanize.new
    @page = agent.get(url)
  end

  def get_h1_tags
    self.get_tags("h1")
  end

  def get_h2_tags
    self.get_tags("h2")
  end

  def get_h3_tags
    self.get_tags("h3")
  end

  protected

  def get_tags(tag)
    tags = @page.search(tag)
    tags.map { |tag| (tag.xpath('text()')).to_s.strip }
  end
end
