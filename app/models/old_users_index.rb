class UsersIndex < Chewy::Index
  # settings analysis: {
    
  #     email: {
  #       tokenizer: 'keyword',
  #       filter: ['lowercase']
  #     }
  
  # }

  define_type User do
    field :name, :phone 
        #field :email#, analyzer: 'email'
    
  end
end