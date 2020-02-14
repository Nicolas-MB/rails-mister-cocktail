class DosesController < ApplicationController

  def new
  @dose = Dose.new
  end

  def create
  @dose = Dose.new(params_dose)
  @cocktail = Cocktail.find(params[:cocktail_id])
  @dose.cocktail = @cocktail
       if @dose.save
        redirect_to cocktail_path(@cocktail)
       else
        render "cocktails/show"

      end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.cocktail

    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)

  end

private

def params_dose
  params.require(:dose).permit(:description, :ingredient_id)
end


end
