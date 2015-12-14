class BooksController < ApplicationController
    def show
        @book = Book.find(params[:id])

        # omit following rule
#        render :show
    end
end
