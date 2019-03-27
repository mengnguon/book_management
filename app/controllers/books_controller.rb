class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    session[:book_id] = @book.id
    if @book.save
      flash[:success] = "Your book was successfully created"
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Your book information was successfully updated"
      redirect_to book_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:danger] = "Book information was successfully deleted"
    redirect_to books_path
  end

  def index
    @books = Book.all
  end

private

  def book_params
    params.require(:book).permit(:title, :isbn, :summaries, :author, :avatar)
  end




end
