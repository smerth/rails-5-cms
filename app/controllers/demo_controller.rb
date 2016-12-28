class DemoController < ApplicationController
  
  layout 'application'

  def index
  end

  def hello
  	@numbers = [1,2,3,4,5,6,7,8,9]

		@id = params['id']
		@page = params[:page]
		# better to cast the page param as an integer right away instead of as below
		# casting it twice...
		@prev_page = @page.to_i - 1
		@next_page = @page.to_i + 1 

  end

  def something
  	# render('hello')
  end

  def other_hello
  	redirect_to(:controller => 'demo', :index => 'index')
  end

end
