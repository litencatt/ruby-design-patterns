class HotPot
  def initialize(pot)
    @pot = pot
  end

  def add_soup(soup)
    @soup = soup
  end

  def add_main(protein)
    @protein = protein
  end

  def add_vegetables(vegetables)
    @vegetables = vegetables
  end

  def add_other_ingredients(other_ingredients)
    @other_ingredients =other_ingredients
  end
end

class NabeFactory
  def soup; end
  def main; end
  def vegetables; end
  def ingredients; end
end

class MizutakiFactory < NabeFactory
  def soup
    ChikenBonesSoup.new
  end

  def main
    Chiken.new
  end

  def vegetables
    vegetables = []
    vegetables << ChineseCabbage.new
    vegetables << Leek.new
    vegetables << Chrysanthemum.new
  end

  def ingredients
    ingredients = []
    ingredients << Tofu.new
  end
end

class KimuchFactory < NabeFactory

end

class SukiyakiFactory < NabeFactory

end

class Chef
  def cook_hotpot(hotpot_kind)
    hotpot = HotPot.new(Pot.new)
    factory = hotpot_factory(hotpot_kind)
    hotpot.add_soup(factory.soup)
    hotpot.add_main(factory.main)
    hotpot.add_vegetables(factory.vegetables)
    hotpot.add_other_ingredients(factory.ingredients)
  end

  def hotpot_factory(hotpot_kind)
    case hotpot_kind
    when :kimuchi
      KimuchFactory.new
    when :sukiyaki
      SukiyakiFactory.new
    else
      MizutakiFactory.new
    end
  end
end

chef = Chef.new
chef.cook_hotpot(:kimuchi)
chef.cook_hotpot(:sukiyaki)
chef.cook_hotpot(:other)
