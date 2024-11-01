class StepsController < ApplicationController
  include Wicked::Wizard
  steps :personal_information, :project, :intrest, :tool
  before_action :set_new_instance
  before_action :authenticate_user!

  def show
    case step
    when :personal_information
      @personal_info = PersonalInformation.new
    when :project
      @project = Project.new
    when :intrest
      @intrest = Intrest.new
    when :tool
      @tool = Tool.new
    else
      redirect_to wizard_path(steps.first) # Redirect to the first step if an invalid step is reached
    end
    render_wizard
  end

  def update
    case step
    when :personal_information
      @personal_info = PersonalInformation.new(personal_information_params.merge(user_id: current_user.id, email: current_user.email))
      if @personal_info.save
        redirect_to next_wizard_path, notice: 'Personal Information saved Successfully'
      else
        render_wizard(status: :unprocessable_entity)
      end
    when :project
      @project = Project.new(project_params.merge(user_id: current_user.id))
      if @project.save
        redirect_to next_wizard_path, notice: 'Project saved successfully'
      else
        render_wizard(status: :unprocessable_entity)
      end
    when :intrest
      @intrest = Intrest.new(intrest_params.merge(user_id: current_user.id))
      if @intrest.save
        redirect_to next_wizard_path, notice: 'Interests saved successfully'
      else
        render_wizard(status: :unprocessable_entity)
      end
    when :tool
      @tool = Tool.new(tool_params.merge(user_id: current_user.id))
      if @tool.save
        flash[:notice] = "Process Complete"
        redirect_to root_path
      else
        render_wizard(status: :unprocessable_entity)
      end
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
    params.require(:project).permit(:name , :detail)

  end
  def intrest_params
    params.require(:intrest).permit(:intrest_name)
  end
  def tool_params
    params.require(:tool).permit(:tool_name)
  end
end
