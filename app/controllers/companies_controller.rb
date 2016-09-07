class CompaniesController < ApplicationController
	before_action :admin?
	before_action :check_admin

	def index
		@company = Company.first
	end

	def edit
		@company = Company.first
	end

	def update
		@company = Company.first
		
		if @company.update(params.require(:company).permit(:name, :website, :address, :logo))
			
		
			redirect_to companies_path
			
		else
			render 'edit'
		end
	end

	def check_admin
		authorize! :manage, :companies
	end

end
