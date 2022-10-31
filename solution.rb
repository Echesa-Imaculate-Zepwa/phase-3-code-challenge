# Please copy/paste all three classes into this file to submit your solution!
# Article
class Article
    
    @@articles = []
    def initialize attributes
        attributes.each {|key,valu
        self.class.attr_accessor(k
        self.send("#{key}=", value
        }
    end 
    def self.all
        @@articles
    end
end


# Author
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


  # Magazine
#require 'pry'

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

#binding.pry