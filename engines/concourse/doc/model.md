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

## CandidateField ##

## CandidateUpload ##

## SendProject ##

## SendProjectField ##

## SendProjectUpload ##

