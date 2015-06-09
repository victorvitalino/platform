# Modelagem #

## Project ##

- name:string:unique
- description:string
- background:string:file
- logo:string:file
- start :date
- end:date
- hour_end:time
- status:boolean
- project_category:references

## ProjectCategory ##

- name:string
- status:boolean

## Page ##

- project:references
- title:string
- link:string
- order:integer
- content:text
- status:boolean

## Candidate ##

- project:references
- name:string
- cpf:string
- telphone:string
- celphone:string
- city:references
- estate:references
- email:string
- password:string
- parameters_fields:text

## CandidateField ##

- project:references
- name
- field_type
- required:boolean
- unique:boolean
- regular_expression


## CandidateUpload ##

## SendProject ##

## SendProjectField ##

## SendProjectUpload ##

