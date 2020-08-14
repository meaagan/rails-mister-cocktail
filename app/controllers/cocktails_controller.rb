class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end
  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredient = Ingredient.new
  end
  def new
    @cocktail = Cocktail.new
  end
  def create
    new_cocktail = Cocktail.create(cocktail_params)
    redirect_to new_cocktail_dose_path(new_cocktail)

    # new_cocktail = Cocktail.new(cocktail_params)
    # if new_cocktail.save
    #   redirect_to new_cocktail_dose_path(new_cocktail)
    # else
    #   render :new
    # end

    # if @cocktail.save
    #   redirect_to cocktail_path(@cocktail)
    # else
    #   render :new
    # end
  end

  private
  
  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
