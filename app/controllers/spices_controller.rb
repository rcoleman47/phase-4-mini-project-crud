class SpicesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /spices
  def index
    render json: Spice.all
  end

  # GET /spices/:id
  # def show
  #   spice = get_spice
  #   render json: spice, status: :ok
  # end

  # POST /spices
  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  # PATCH/PUT /spices/:id
  def update
    spice = get_spice
    spice.update(spice_params)
    render json: spice, status: :accepted
  end

  # DELETE /spices/:id
  def destroy
    spice = get_spice
    spice.destroy
    head :no_content
  end

  private

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def get_spice
    Spice.find(params[:id])
  end

  def render_not_found_response
    render json: {error: "Spice not found"}, status: :not_found
  end
end
