class Magazine
  attr_accessor :name, :category

  @@magazines = []

  def initialize(name, category)
    @name = name
    @category = category
    @@magazines << self
  end

  def self.all
    @@magazines
  end

  def contributors
    articles_for_magazine_instance.map {|filterd_article| filterd_article.author}
  end

  def self.find_by_name magazine_name
    Magazine.all.find {|magazine| magazine.name == magazine_name}
  end

  def article_titles
    articles_for_magazine_instance.map {|filterd_article| filterd_article.title}
  end

  def contributing_authors
    author_tally = contributors.tally   
    author_tally.filter do |key, value|
      value >=2
    end
  end

  private
  
  def articles_for_magazine_instance
    Article.all.filter do |article|
      article.magazine == self
    end
  end
end