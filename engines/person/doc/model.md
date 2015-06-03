# Modelagem #

## User ##

- name:string
- cpf:string:unique
- rg:string:unique
- rg_org:string
- rg_uf:string
- start_hour:time
- end_hour:time
- wekeend:boolean
- attendant:boolean
- code:string:unique
- email:string:unique
- password:string
- password_confirmation:string
- blood_type:string
- born:date
- current_sector:references
- origin_sector:references
- ramal:references
- curriculum:string
- date_contract:date
- job:references
- status:boolean
- branch_line:references
- avatar:string

## Job ##

- name:string
- code:string:unique
- status:boolean

## Sector ##

- name:string
- acron:string:unique
- father:references
- status:boolean
- responsible:references

## BranchLine ##

- sector:references
- code:string:unique
- status:boolean

## System ##

- name:string:unique
- description:string
- status:boolean

## SystemPermisson ##

- system:references
- action:string
- status:boolean
- code:string:unique

## UserPermisson

- user:references
- system_permission:references
- status:boolean