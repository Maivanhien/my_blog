class ApplicationController < ActionController::Base
	before_action :set_action_cable_indentifier

	private

	def set_action_cable_indentifier
		cookies.encrypted[:author_id] = current_author&.id
	end
end
