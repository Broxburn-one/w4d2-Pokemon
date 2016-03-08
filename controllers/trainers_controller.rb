require_relative('../models/pokemon.rb')
require_relative('../models/trainer.rb')

get '/trainers' do
  #INDEX
  @trainers = Trainer.all()
  erb :"trainers/index"
end

get '/trainers/new' do
  #NEW
  erb :"trainers/new"
end

get '/trainers/:id' do
  #SHOW
  @trainer = Trainer.find(params[:id])
  erb :"trainers/show"
end

get '/trainers/edit' do
  #EDIT
  erb :"trainers/edit"
end

post '/trainers' do
  #CREATE
  @trainer = Trainer.new( params )
  @trainer.save()
  redirect to("/trainers")
end

  #UPDATE
post '/trainers/:id' do
  @trainer = Trainer.new( params )
  @trainer.update()
  redirect to("/trainers/#{params['id']}")
end

#DELETE
post '/trainers/:id/delete' do
  Trainer.destroy(params[:id])
  redirect to('/pokemons')
end