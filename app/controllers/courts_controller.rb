class CourtsController < ApplicationController
  before_action :set_court, only: [:edit, :show, :update]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @courts = Court.includes(:user).order("created_at DESC")
  end

  def new
    @court = Court.new
  end

  def create
    @court = Court.new(court_params)
    if @court.save
      render :create
    else
      render :new
    end
  end

  def destroy
    court = Court.find(params[:id])
    court.destroy
  end

  def edit
  end

  def update
    @court.update(court_params)
    if @court.save
      render :update
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @court.comments.includes(:user)
  end

  def search
    @courts = Court.search(params[:keyword])
  end

  private

  def court_params
    params.require(:court).permit(:image, :text).merge(user_id: current_user.id)
  end
  
  def set_court
    @court = Court.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end