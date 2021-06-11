class ProjectsController < ApiController
    before_action :set_project, only: [:show, :update, :destroy]
    before_action :authorized

  # GET /projects
  def index
    @projects = Project.all
    render json: @projects
  end

  # GET /project/1
  def show
    render json: @project
  end

  # POST /project
  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: {error: @project.errors.full_messages.join("; ")}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /project/1
  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /project/1
  def destroy
    @project.destroy
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.permit(:project)
    end
end