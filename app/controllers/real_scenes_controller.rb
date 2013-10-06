class RealScenesController < ApplicationController
  
  layout 'admin'

  def index
    @scenes = RealScene.all.reverse
    post_credits_scene = RealScene.new

    respond_to do |format|
      format.html
      format.csv { send_data @scenes.to_csv }
    end
  end

  def update
    @scene = RealScene.find(params[:id])
    respond_to do |format|
      if @scene.update(scene_params)
        format.html { redirect_to real_scenes_path }
      else
        format.html { render action: 'edit' }
      end
    end

  end

  def edit
    @scene = RealScene.find(params[:id])

  end

  def new
    @scene = RealScene.new
  end

  def create

    @scene = RealScene.new(scene_params)

    search = Imdb::Search.new(@scene.title)
    not_movies = ["TV Series","TV Episode", "Video","Video Game", "Short"]
    movie_info = search.movies.select{|movie| not_movies.include?(movie.title.split("(")[-1][0..-2]) == false}[0]
    @scene.title = movie_info.title
    @scene.imdb_id = movie_info.id

    respond_to do |format|
      if @scene.save

        
  
        format.html { redirect_to real_scenes_path }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    RealScene.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to real_scenes_url }
    end
  end



  def import
    RealScene.import(params[:file])
    redirect_to root_url, notice: "Scenes imported."
  end

  private
    def scene_params
      params.require(:real_scene).permit(:text, :imdb_id, :title)
    end

end
