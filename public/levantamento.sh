rails g model deficit name cpf phone address lot_houses:integer lot_people:text water:bool light:bool sidewalk:bool sewer:bool asphalt:bool, bathroom:bool total_bathroom:integer kitchen:bool roof:text slab:bool contract:bool document:text people_living:integer wall:boolean room:integer sleep_local:text rent:boolean rent_total:string buy_lot


rails g migration add_benefit_to_deficit benefit:integer
rails g migration add_property_type_to_deficit property_type:integer
rails g migration add_family_income_to_deficit family_income:integer
