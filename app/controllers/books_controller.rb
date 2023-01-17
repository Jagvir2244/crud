class BooksController < ApplicationController
    protect_from_forgery with: :null_session

  def index
    books = Book.all
    render json: {
      books: books
    }
  end

  def show
    book = Book.find(params[:id]) rescue nil
    if book.present?
      render json: {
        book: book
      }
    else
      render json: {
        error: "book not exist"
      }
    end
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json:{
        success: true,
        action: "create",
        book: book

      }
    else
      render json:{
        error: "book not create",
        message: "book not create"
      }
    end
  end

  def update
    book = Book.find(params[:id]) rescue nil
    if book.present?
     book.update(book_params)
     render json:{
      book: book
      } 
   else
    render json:{
      error: "book not exist"
      }
  end

  end

  def destroy
    book = Book.find(params[:id]) rescue nil
    if book.present?
      book.destroy
      render json:{
        message: "book deleted "
      }
    else
      render json: {
        error: "book not exist"
      }
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :auther, :publication_year)
  end
end