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

class Chef
  def cooking
    hotpot = HotPot.new(Pot.new)
    hotpot.add_soup(ChikenBonesSoup.new)
    hotpot.add_main(Chiken.new)
    hotpot.add_vegetables(vegetables)
    hotpot.add_other_ingredients(ingredients)
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

