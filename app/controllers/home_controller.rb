class HomeController < ApplicationController
  def index
    @users = User.all
    @dummyfiles = Dummyfile.all
  end
  
  def create
    #@user = User.new
  end
  
  def show
    #@user = User.params([:id])
  end
  
  def execute
    @dummyfile = Dummyfile.new(params[:dummyfile])
    if @dummyfile.save
      @dummyfile.convert
      flash[:notice] = 'Your file has been generated.'
      redirect_to :action => 'index'
    else
      flash[:notice] = 'There was a problem generating your file. Please try again.'
      redirect_to :action => 'index'
    end
  end
  #def delete
  #  @user = User.params([:id]).delete(:method => delete)
  #end
end
