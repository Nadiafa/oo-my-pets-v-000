class Owner
  attr_accessor :name, :pets
  attr_reader :species

  @@owners = []
  
  def self.all 
    @@owners 
  end 
  
  def self.count
    @@owners.count
  end
  
  def self.reset_all 
    @@owners.clear
  end
  
  def initialize(species)
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats=> []}
    @@owners << self
  end 
  
  # instance methods

  def say_species
    "I am a #{@species}."
  end 
  
  def buy_fish(name)
    @new_fish = Fish.new(name)
    @pets[:fishes] << @new_fish
  end
  def buy_cat(name)
    @new_cat = Cat.new(name)
    @pets[:cats] << @new_cat
  end
  def buy_dog(name)
    @new_dog = Dog.new(name)
    @pets[:dogs] << @new_dog
  end
  def walk_dogs
    @pets[:dogs].each { |dog| dog.mood = "happy" }
  end
  def play_with_cats
    @pets[:cats].each { |cat| cat.mood = "happy" }
  end
  def feed_fish
    @pets[:fishes].each { |fish| fish.mood = "happy" }
  end
  def sell_pets
  #     can sell all its pets, which make them nervous
    @pets.each do |k,v|
      v.each do |pet|
        pet.mood = "nervous"
      end
    end 
    @pets.clear
  end
  def list_pets
  #     can list off its pets 
   "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end
end




# rspec ./spec/owner_spec.rb
