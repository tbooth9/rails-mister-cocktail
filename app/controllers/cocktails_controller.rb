class CocktailsController < ApplicationController
  def index
  	@cocktails = Cocktail.all
  end

  def show
  	@cocktail = Cocktail.find(params[:id])
  end

  def new
  	# create blank form
  	@cocktail = Cocktail.new
  	# Cocktail(name: nil)
  end

  def create
  	@cocktail = Cocktail.new(cocktail_params)
  	# Cocktail(name: "Some Cocktail Name")
  	if @cocktail.save
  		redirect_to cocktail_path(@cocktail)
  	else
  		render :new
  	end
  end

  def edit
  	@cocktail = Cocktail.find(params[:id])
  end

  def update
  	@cocktail = Cocktail.find(params[:id])
  	@cocktail.update(cocktail_params)
  	if @cocktail.save
  		redirect_to cocktail_path(@cocktail)
  	else
  		render :edit
  	end
  end


  def destroy 
  	@cocktail = Cocktail.find(params[:id])
  	@cocktail.destroy
  	redirect_to cocktails_path
  	# do not have a cocktail, so go to index instead
  end

  def cocktail_params
	params.require(:cocktail).permit(:name)  	
  end
end
