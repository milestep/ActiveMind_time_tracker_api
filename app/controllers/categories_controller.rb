class CategoriesController < ApiController
    before_action :set_category, only: [:show, :update, :destroy]
    before_action :authorized

  # GET /categories
  def index
    @categories = Category.all
    render json: @categories
  end

  # GET /category/1
  def show
    render json: @category
  end

  # POST /category
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /category/1
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /category/1
  def destroy
    @category.destroy
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.permit(:category)
    end
end