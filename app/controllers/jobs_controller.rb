class JobsController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def show
    render json: Job.find(params["status"])
  end

end
