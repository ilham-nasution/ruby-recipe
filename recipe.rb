class Recipe
  attr_reader :name, :ingredients, :method_steps

  @@recipes = {}

  class << self 
    def clear
      @@recipes = {}
    end
    
    def describe(&block)
      
      puts instance_eval(&block)
    end
  
    def recipe(name, &block)
      @@recipes[name] = Recipe.new(name)
      @@recipes[name].instance_eval(&block)
    end
  
    def for(name)
      @@recipes[name]
    end
  end

  def initialize(name)
    @name = name
    @ingredients = []
    @method_steps = []
  end

  def ingredient(ingredient)
    @ingredients << ingredient
  end

  def method(&block)
    instance_eval(&block)
  end

  def step(step)
    @method_steps << step
  end
end
