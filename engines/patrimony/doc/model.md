# Modelagem #

## Property ##

- name:string
- description:string

## Type Material ##

- name:string
- description:string
- percentage:integer
- life_cycle:integer

## Material ##

- name:string
- description:string
- type_material:references

## Drive ##

- sector_old:integer
- user_old:integer
- date_drive:date
- user:references
- sector:references

## Serial Number ##

- name:string
- number:string
- patrimony_id:integer

## Patrimony ##

- code_patrimony:string
- date_acquisition:string
- status:boolean
- sector:references
- material:references
- property:references
- user:references
