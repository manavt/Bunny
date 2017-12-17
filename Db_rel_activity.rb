Get
ModelClassName.first
ModelClassName.last
ModelClassName.all
ModelClassName.count
ModelClassName.pluck(:name)
ModelClassName.where()
ModelClassName.find id
ModelClassName.find_by_column_names("value here")

Post
1.

p = ModelClassName.new(params)
p.save # true | false

2.
p = ModelClassName.create(params)
p # is the return from create function




Update

update_columns # to update the single columns
update  # to upldate the complete object



Delete


delete # delete the particular object
destroy # deletes dependency records too










Migration related

Create new table
rails g model model_name coulumn_names
rake db:migrate

Rename column name

Delete column name 

Delete table
