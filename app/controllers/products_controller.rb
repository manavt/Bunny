require 'csv'
class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def download_in_csv
    filename = "export_in_csv.csv"
    filepath = "#{Rails.root}/public/"
    full_file_path = filepath + filename
    CSV.open(full_file_path, "w") do  |csv|
      csv << Product.column_names # header
      Product.pluck("id", "name", "size", "price", "brand", "description", "created_at", "updated_at").
      each do | product |
        csv << product
      end
    end
    redirect_to products_path
    send_file full_file_path, :disposition => 'attachment'

  end
  def download_in_json
    filename = "Export.json"
    filepath = "#{Rails.root}/public/"
    full_file_path = filepath + filename
    file = File.open(full_file_path, "w")
    file.write Product.all.to_json
    file.close
    send_file full_file_path, :disposition => 'inline'
  end

  def edit
  end

  def show
  end

  def new
    @product = Product.new
  end
  def create
   image_attributes = params[:product]["image"]["photo"]
   params[:product].delete(:image)
   @product = Product.new(product_params)
   if @product.save
     image_attributes.each do | image |
        @product.images.create(photo: image)
        # Image.create(photo: image, product: @product)
        # Image.create(photo: image, product_id: @product.id)
     end
     redirect_to products_path
     flash[:notice] = "Product got added successfully"
   else
     render :new
     flash[:notice] = "Something went wrong!!!"
   end
  end
  def product_params
    params.require(:product).permit!
  end
end
