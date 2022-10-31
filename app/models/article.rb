class Article
    
    @@articles = []
    def initialize attributes
        attributes.each {|key,value|
        self.class.attr_accessor(key)
        self.send("#{key}=", value)
        }
    end 
    def self.all
        @@articles
    end
end