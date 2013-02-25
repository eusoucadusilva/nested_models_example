class ProductsController < ApplicationController
   def index
      @products = Product.includes(:category).order(:name)
   end

   def new
      @product = Product.new { |p| p.build_category }
      #@product.build_category
   end

   def create         
      @product = Product.new params_product

      if @product.save
         flash[:notice] = "Product created with successfully!"
         redirect_to products_path      
      else
         render :new
      end
   end

   def edit
      @product = Product.find(params[:id])
   end

   def update
      @product = Product.find(params[:id])

      if @product.udpate_attributes params_product
         flash[:notice] = "Product updated with successfully!"
         redirect_to products_path      
      else
         render :edit
      end
   end

   private
   def params_product
      parameters = params[:product]

      if parameters[:category_attributes] && !parameters[:category_attributes][:description].empty?
         parameters.delete :category_id
      else
         parameters.delete :category_attributes
      end

      parameters
   end
end