class CourtsController < ApplicationController
  before_action :set_court, only: [:edit, :show]
  before_action :find_court, only: [:destroy, :update]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @courts = Court.includes(:user).order("created_at DESC")
  end

  def new
    @court = Court.new
  end

  def create
    Court.create(court_params)
  end

  def destroy
    court.destroy
  end

  def edit
  end

  def update
    court.update(court_params)
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

  def find_court
    court = Court.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end