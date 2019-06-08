class JobsController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def show
    render json: Job.find(params["status"])
  end

  def create
    render json: Job.create(params["job"])
  end

  def update
    render json: Job.update(params["id"], params["job"])
  end

  def delete
    render json: Job.delete(params["id"])
  end

end
