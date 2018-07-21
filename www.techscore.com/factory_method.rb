class CutPrint
  def create_cut_print
    hanzai = create_cuttable
    draw(hanzai)
    cut(hanzai)
    print(hanzai)
  end

  # デフォルトの版材は木
  def create_cuttable
    Wood.new
  end
end

class ImagawasCutPrint < CutPrint
  def draw(hanzai)
    puts "draw"
  end

  def cut
    puts "cut"
  end

  def print
    puts "print"
  end

  # サブクラス側で使用する版材を変更できる
  def create_cuttable
    Potato.new
  end
end
