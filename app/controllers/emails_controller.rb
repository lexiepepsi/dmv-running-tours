class EmailsController < ApplicationController
  def index
  	@email = Email.new
  end

  def create
  	@email = Email.create(params[:email].permit(:name, :email))
  	
  	WelcomeEmailWorker.perform_async(@email.name, @email.email)

  	redirect_to(emails_path, notice: 'Thanks! You are on the list!')
  end
end