class MoviesController < ApplicationController

  def index

    if params[:query]
      if params[:query] != ""
        # @movies = Movie.search(params[:query]).order("created_at DESC")

        @movies = Movie.by_title(params[:query])
      else
        flash.now[:error] = "Enter search terms!"
        @movies = Movie.all

      end
    else
      @movies = Movie.all
    end

  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

    def movie_params
    params.require(:movie).permit(:title, :director, :runtime_in_minutes, :description, :release_date, :poster_image_url, :created_at, :updated_at, :image )
  end

end