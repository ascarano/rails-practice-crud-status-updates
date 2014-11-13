class UpdatesController < ApplicationController

  def index
    @updates = Update.all
  end

  def new
    @update = Update.new
  end

  def create
    @update = Update.new(params.require(:update).permit(:status, :user, :likes))
    if @update.save
      redirect_to update_path(@update), notice: "You created a Status Update!"
    else
      render :new
    end
  end

  def edit
    @update = Update.find(params[:id])
  end

  def update
    @update = Update.find(params[:id])
    if @update.update(params.require(:update).permit(:status, :user, :likes))
      redirect_to update_path(@update), notice: "You updated a Status Update!"
    else
      render :new
    end
  end

  def show
    @update = Update.find(params[:id])
  end

  def destroy
    @update = Update.find(params[:id])
    @update.destroy
    redirect_to root_path, notice: "You deleted a Status Update!"
  end

end
