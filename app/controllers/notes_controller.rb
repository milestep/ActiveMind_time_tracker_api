class NotesController < ApiController
    before_action :set_note, only: [:show, :update, :destroy]
    before_action :authorized

  # GET /notes
  def index
    if @user.is_admin == false
      @notes = Note.where(user_id: @user.id)
    else
      @notes = Note.all
    end
    render json: @notes
  end

  # GET /notes/1
  def show
    render json: @note
  end

  # POST /notes
  def create
    @note = Note.new(note_params)
    @note.user_id = @user.id

    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
  end

  private

    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:hours, :date, :user_id, :project_id, :category_id)
    end
end