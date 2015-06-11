rails g scaffold property name description
rails g scaffold type_material name description percentage:integer life_cycle:integer
rails g scaffold material name description type_material:references
rails g scaffold patrimony code_patrimony date_acquisition:date status:boolean sector:references user:references material:references property:references
rails g scaffold serial_number name number patrimony:references
rails g scaffold drive date_drive:date sector_old:integer user_old:integer sector:references user:references patrimony:references
