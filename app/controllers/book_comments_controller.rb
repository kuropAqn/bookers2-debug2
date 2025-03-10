class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
  end

  def destroy
    BookComment.find(params[:id]).destroy
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  def is_matching_login_user
    comment = BookComment.find(params[:id])
    unless comment.user.id == current_user.id
      redirect_to books_path
    end
end


end
