class User::StepsController < ApplicationController
  include Wicked::Wizard
  steps :personal_information, :project, :intrest, :tool
  before_action :set_new_instance
  before_action :authenticate_user!

  def show
    case step
    when  :personal_information; end
      render_wizard
  end

  def update
    case step
    when :personal_information
     @personal_info = PersonalInformation.create(personal_information_params.merge(user_id: current_user.id, email: current_user.email))
    when :project
      @project  = Project.create(project_params.merge(user_id: current_user.id))
    when :intrest
      @intrest = Intrest.create(intrest_params.merge(user_id: current_user.id))
    when :tool
      @tool = Tool.create(tool_params.merge(user_id: current_user.id))
    end
  end
private
  def set_new_instance
    @tool = Tool.new
    @personal_info = PersonalInformation.new
    @intrest = Intrest.new
    @project = Project.new
  end

  def personal_information_params
    #the email will be added by current_user.email
    params.require(:personal_information).permit(:name, :contact_no , :address)
  end
  def project_params
    params.require(:project).permit(:name , :details)

  end
  def intrest_params
    params.require(:intrest).permit(:intrest_name)
  end
  def tool_params
    params.require(:tool).permit(:tool_name)
  end
end
