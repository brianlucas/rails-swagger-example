rails g model Cookie cookie_type:string gluten_free:boolean price:float monster:references --force

rails g model Monster first_name:string last_name:string email:string role:string color:string  --force
 
SD_LOG_LEVEL=1 rake swagger:docs
 
rake db:create
rake db:migrate
 (and here either reference:product or references:product