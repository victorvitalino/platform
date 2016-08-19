module InfoCenter
  class Deficit < ActiveRecord::Base

    enum benefit: ["Bolsa Família","Auxílio-aluguel","BPC","Auxílio-reclusão"]
    enum family_income: ["0 a 3","3 a 6","6 a 10","10 +"]
    enum property_type: ["Urbano","Rural"]
    
  end
end
