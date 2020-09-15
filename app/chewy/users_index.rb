class UsersIndex < Chewy::Index

  define_type User do
    #field :name
    field :name#, analyzer: 'lowercased'
    #field :email#, analyzer: 'email'
    
  end
end