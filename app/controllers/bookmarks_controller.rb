class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = @bookmark.list.build(movie_id: params[:movie_id]) # finding list asssociated with the bookmark

    if @bookmark.save
      redirect_to new_list_bookmark_path(@bookmark)
  end
  # @bookmark = @list.bookmarks.build(movie_id: params[:movie_id])

  #   # Handle successful bookmark creation (e.g., redirect, flash message)
  #   redirect_to list_path(@list), notice: "Movie added to list!"
  # else
  #   # Handle errors (e.g., render the form again with error messages)
  #   render :new, status: :unprocessable_entity
  # end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
