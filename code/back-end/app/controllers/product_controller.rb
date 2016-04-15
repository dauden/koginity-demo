class ProductController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => :list
	def list
		@title =  params[:title]
		@price_from =  params[:price_from]
		@price_to =  params[:price_to]

		if @price_from != nil and @price_from != '' and @price_from != nil and @price_from != ''
			@products = Product.where("title LIKE :title and price >= :price_from  and price <= :price_to", title: "%#{@title}%", price_from: @price_from , price_to: @price_to )
		elsif @price_from == '' and @price_to != nil
			@products = Product.where("title LIKE :title and price <= :price_to", title: "%#{@title}%", price_to: @price_to )
		elsif @price_from != nil and @price_to == ''
			@products = Product.where("title LIKE :title and price >=:price_from", title: "%#{@title}%", price_from: @price_from )
		else
			@products = Product.where("title LIKE :title ", title: "%#{@title}%")
		end
	end

	def detail
		@id = params[:id]
      
      	@product = Product.find_by(id: @id)
	end
end
