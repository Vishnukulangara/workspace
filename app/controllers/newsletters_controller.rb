class NewslettersController < ApplicationController
	before_action :admin?
	before_action :check_admin
	def index
	end

	def show
		@newsletter = Newsletter.find(params[:id])
	end

	def new
		@newsletter = Newsletter.new
	end

	def edit
		@newsletter = Newsletter.find(params[:id])
	end

	def create
		@newsletter = Newsletter.new
		@newsletter.content = params[:content]
		@newsletter.schedule_at = params[:schedule_at]
		if @newsletter.save
			@schedule_time = (params[:schedule_at].to_time-Time.now)


			if params[:sent_to][:all] == '1'
				Employee.find_each do |e|
					@newsletter.sent_to<<e.id
					
					Resque.enqueue_at(@schedule_time.seconds.from_now, Mailer , params[:content], e.email)
				end

			else
				Employee.find_each do |e|
					if params[:"#{e.id}"] == "on"
						@newsletter.sent_to<<e.id
						@schedule_time = (params[:schedule_at].to_time-Time.now)
						

						Resque.enqueue_at(@schedule_time.seconds.from_now, Mailer , params[:content], e.email)
					end
				end

			end
			if @newsletter.save
				redirect_to newsletters_path
			else 
				render 'new'
			end
		else 
			render 'new'
		end
		
	end

	def update
		@newsletter = Newsletter.find(params[:id])
	end

	def delete
		@newsletter = Newsletter.find(params[:id])
		@newsletter.destroy
		redirect_to newsletters_path
	end

	def check_admin
		authorize! :manage, :newsletters
	end
end

