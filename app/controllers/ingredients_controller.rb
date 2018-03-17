class IngredientsController < ApplicationController
    before_action :set_ingredient, only: [:edit, :update, :show]
    before_action :require_admin, except: [:show, :index]
    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
            flash[:success]= "created successfully"
            redirect_to ingredient_path(@ingredient)
        else render 'new'
        end
    end

    def update
        if @ingredient.update(ingredient_params)
            flash[:success] = "updated succcessfully"
            redirect_to @ingredient
         else 
            render 'edit'
         end
    
    end

    def show
        @ingredient_recipes = @ingredient.recipe.paginate(page: params[:page], per_page: 4)
    end

    def index
        @ingredients = Ingredient.paginate(page: params[:page], per_page: 3)
    end

end
private
 def ingredient_params
  params.require(:ingredient).permit(:name)
 end
 def set_ingredient
    @ingredient = Ingredient.find(params[:id])
 end
 def require_admin
    if logged_in? && !current_chef.admin?
        flash[:danger] = "only admin can do this"
            redirect_to @ingredient
        else render 'edit'
        end
 end