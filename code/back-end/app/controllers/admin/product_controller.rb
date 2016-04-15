class Admin::ProductController < ApplicationController
  layout "admin"
  @errors = nil
  def list
    @errors = session[:tmp_deleted]
    session[:tmp_deleted] = nil
    @products = Product.all
  end

  def add
    if request.post?
      @title = params[:title]
      @price = params[:price]
      @sizes = params[:sizes]
      @thumbnails = params[:thumbnails]
      @thumbnail = DataFile.save(@thumbnails)
      p @thumbnail
      @rating = params[:rating]
      
      @product = Product.new(title: @title, price:  @price, sizes: @sizes, rating: @rating, thumbnail: @thumbnail)
      @product.save
      redirect_to action: :'list'
    end
  end

  def edit
    @id = params[:id]
      
    @product = Product.find_by(id: @id)
    
    if request.post?
      if @product == nil
        @product = Product.new
      end

      @title = params[:title]
      @price = params[:price]
      @sizes = params[:sizes]
      @rating = params[:rating]
      @thumbnail = @product.thumbnail

      if(params[:thumbnails] != nil)
        @thumbnail = DataFile.save(params[:thumbnails])
      end
      

      if @product.update(title: @title, price:  @price, sizes: @sizes, rating: @rating, thumbnail: @thumbnail)
        redirect_to action: :'list'
      else
        @errors =  'Update unsuccessfull, Please try again.'
      end

    end

  end

  def delete
      @id = params[:id]
      
      @product = Product.find_by(id: @id)
      if @product != nil
         @product.destroy
         redirect_to action: :'list'
      else
        session[:tmp_deleted] =  'Delete unsuccessfull, Product can not be found.'
        redirect_to action: :'list'
      end
  end
end
