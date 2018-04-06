class DosesController < ApplicationController
  def new
  	@dose = Dose.new
  	@cocktail = Cocktail.find(params[:cocktail_id])
  	# Dose.new(description: nil, cocktail_id: nil, ingredient_id: nil)
  end

  def create
  	@dose = Dose.new(dose_params)
  	@cocktail = Cocktail.find(params[:cocktail_id])
  	# Dose.new(description: "slice", cocktail_id: 5, ingredient_id: 2 (from the frontend))
  	@dose.cocktail_id = @cocktail.id
	if @dose.save
		redirect_to cocktail_path(@cocktail)
	else
		render :new
	end 	
  end

  def destroy
  	@dose = Dose.find(params[:id])
  	@cocktail = @dose.cocktail
  	@dose.destroy
  	redirect_to cocktail_path(@cocktail)
  	
  end

  private

  def dose_params
  	params.require(:dose).permit(:description, :ingredient_id)
  end
end
