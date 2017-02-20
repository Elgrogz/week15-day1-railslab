class DogsController < ApplicationController

  def dog_params
    params.require(:dog).permit([:name, :breed, :imgURL])
  end

  def index
    dogs = Dog.all
    render json: dogs
  end

  def show
    dog = Dog.find(params[:id])
    render json: dog
  end

  def create
    dog = Dog.create(dog_params)
    render json: dog
  end

  def update
    dog = Dog.find(params[:id])

    if dog.update_attributes(dog_params)
      render json: dog
    else 
      render json: update_attributes
    end
  end

  def destroy
    dog = Dog.find(params[:id])
    if dog.destroy!
      render json: {status: :success}
    else 
      render json: {status: :delete_failed}
    end
  end


end