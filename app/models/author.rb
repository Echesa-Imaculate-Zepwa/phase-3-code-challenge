class Author
  attr_accessor :name


  def initialize(name)
    @name = name
  end

  def articles
    Article.all.filter {|article|
    article.author = self
    }
  end
  def magazines
    magazines = self.articles.map do |article|
      article.magazine
    end
    magazines.uniq
  end

  def add_article(magazine, title)
    Article.new(title,self,magazine)
  end

  def topic_areas
    self.magazines.map {|magazine| magazine.category}
  end

end