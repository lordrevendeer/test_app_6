class CategoriesController < ApplicationController
   before_action :require_admin, except: [:index, :show]
   before_action :require_user, except: [:index]
   def new
     @category = Category.new
   end

   def create
    @category = Category.new(category_params)
    if @category.save
        flash[:notice] = "Category was successfully created"
        redirect_to @category
    else
        render 'new'
    end        
   end 
   
   def index
     @categories = Category.paginate(page: params[:page], per_page: 5)
   end

   def show
     @category = Category.find(params[:id])
   end

   def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category and all associated habits deleted"
    redirect_to categories_path
   end 

   def edit
    @category = Category.find(params[:id])
   end 

   def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
        flash[:notice] = "Your account information was successfully updated"
        redirect_to @category
    else
        render 'edit'
    end       
end 
   private

   def category_params
     params.require(:category).permit(:name)
   end  

   def require_admin
      if !(logged_in? && current_user.admin?)
        flash[:alert] = "Action restricted to admins"
        redirect_to categories_path
      end  
   end 
end    