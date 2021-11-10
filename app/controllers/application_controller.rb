class ApplicationController < Sinatra::Base

  # add routes

  set :default_content_type, 'application/json'
  get '/bakeries' do
    "Hello Bakeries"
    bakeries= Bakery.all
    bakeries.to_json(include: :baked_goods)
    # render.json bakeries
  end

  get '/bakeries/:id' do
    bakery= Bakery.find_by(id: params[:id])
    if bakery
      bakery.to_json(include: :baked_goods)
    else 
      "404 Error got to a different street"
    end
  end
  
  get '/baked_goods/by_price' do
    baked_goods= BakedGood.order(price: :desc)
    baked_goods.to_json
  
  end


  get '/baked_goods/most_expensive' do 
    baked_good= BakedGood.order(price: :desc).limit(1)
    baked_good[0].to_json
    # baked_good.flatten.to_json

  end


end
