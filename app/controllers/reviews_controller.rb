class ReviewsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @review = @list.reviews.build(review_params)
    @review.created_at ||= Time.now  # Assure que created_at est toujours défini

    if @review.save
      redirect_to list_path(@list), notice: "Review added successfully"
    else
      @bookmark = Bookmark.new
      render "lists/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to list_path(@review.list)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
