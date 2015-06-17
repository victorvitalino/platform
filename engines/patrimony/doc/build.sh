rails g scaffold property name description status:boolean
rails g scaffold type_material name description percentage:integer life_cycle:integer status:boolean
rails g scaffold material name description type_material:references status:boolean
rails g scaffold good code_goods date_acquisition:date status:boolean sector:references user:references material:references property:references
rails g scaffold serial_number name number good:references status:boolean
rails g scaffold drive date_drive:date sector:references user:references good:references status:boolean
