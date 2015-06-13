class HaikusController < ApplicationController

  before_action :set_haiku, only: [:show, :edit, :update, :destroy]

  def index
    @haikus = Haiku.all
  end

  def new
    @haiku = Haiku.new
  end

  def create
    @haiku = Haiku.new(haiku_params)

    if @haiku.save
      redirect_to @haiku
    else
      flash[:errors] = "You ain't done this shit right"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @haiku.update(haiku_params)
      redirect_to @haiku
    else
      flash[:errors] = "Ya dun goofed"
      render :edit
    end
  end

  def destroy
    @haiku.destroy
    redirect_to haikus_path
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def upvote
    @haiku = Haiku.find(params[:id])
    if current_user
      if @haiku.votes.create(user_id: current_user.id)
       #flash[:notice] =  "Thank you for upvoting!"
       redirect_to(haikus_path)
      else
       #flash[:notice] =  "You have already upvoted this!"
       redirect_to(haikus_path)
      end
    else
      redirect_to login_path
    end
  end

  private

  def haiku_params
    params.require(:haiku).permit(:title, :line1, :line2, :line3, :author)
  end

  def set_haiku
    @haiku = Haiku.find(params[:id])
  end
end
