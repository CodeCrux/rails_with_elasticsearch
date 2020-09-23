# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do 
  if company = Company.create( name: Faker::Company.name,
                              industry: Faker::Company.industry,
                              turn_over: (2 .. 50000).to_a.sample,
                              established_date:Faker::Date.backward(days: 600),
                              type_of_company: Faker::Company.type
                            )
 	  30.times do
      Article.create( name: Faker::Food.dish, 
							    	  body: Faker::Food.description,
							    	  related_to: Faker::Food.dish,
							    	  company_id: company.id
    	              ) 
    end
  end
end