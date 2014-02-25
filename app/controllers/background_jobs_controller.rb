class BackgroundJobsController < ApplicationController
  def check_progress
    job = BackgroundJob.find(params[:id])

    respond_to do |format|
      format.text {render text: job.progress}
    end
  end
end
