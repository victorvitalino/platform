rails $1 model cadastre cpf gender born:date rg rg_org rg_uf uf_born place_birth arrival_df_date:date

rails $1 model special_condition description status:boolean
rails $1 model civil_status name status:boolean

rails $1 model cadastre_adjunct name telephone telephone_2 cell_phone email city:reference zipe_code:reference addess:reference address_adjunct income zipe_code_work:reference city_work:reference password remember_password nis cid special_condition_flag:boolean cadastre:reference civil_status:reference special_condition:reference

rails $1 model kinship name status:boolean

rails $1 model kin name cpf rg rg_org rg_uf born:date gender place_birth status:boolean cadastre:reference

rails $1 model kin_adjunct income percent kint_type:reference civil_status:reference kin:reference kinship:reference copurchaser_flag:boolean




