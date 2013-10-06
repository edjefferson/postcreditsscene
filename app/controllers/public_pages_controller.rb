class PublicPagesController < ApplicationController
  layout 'admin'
  
  def index
    if params[:q] != nil
      @movie = find_movie(params[:q])

      
      @title = @movie.title
      @character = "#{@movie.main_char} (#{@movie.main_cast})"
      @character_two = "#{@movie.second_char} (#{@movie.second_cast})"
      @post_credits_scene = PostCreditsScene.all.to_a.sample
      @scene_text = @post_credits_scene.text.gsub("CHARACTER_ONE",@character).gsub("CHARACTER_TWO",@character_two)
    else
      @post_credits_scene = PostCreditsScene.new
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def find_movie(text)
    lookup = Movie.where(search: text.downcase).first
    if lookup == nil
      search = Imdb::Search.new(text)
      not_movies = ["TV Series","TV Episode", "Video","Video Game", "Short"]
      movie_info = search.movies.select{|movie| not_movies.include?(movie.title.split("(")[-1][0..-2]) == false}[0]
      Movie.create(search: text.downcase, title: movie_info.title, main_char: movie_info.cast_characters[0].gsub(" (voice)",""), main_cast: movie_info.cast_members[0], second_char: movie_info.cast_characters[1].gsub(" (voice)",""), second_cast: movie_info.cast_members[1])
      lookup = Movie.where(search: text.downcase).first
    end
    lookup
  end
end
