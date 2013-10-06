class PostCreditsScenesController < ApplicationController
  
  layout 'admin'

  def index
    @scenes = PostCreditsScene.all
    post_credits_scene = PostCreditsScene.new

    respond_to do |format|
      format.html
      format.csv { send_data @scenes.to_csv }
    end
  end

  def update
    @scene = PostCreditsScene.find(params[:id])
    respond_to do |format|
      if @scene.update(scene_params)
        format.html { redirect_to post_credits_scenes_path }
      else
        format.html { render action: 'edit' }
      end
    end

  end

  def edit
    @scene = PostCreditsScene.find(params[:id])

  end

  def new
    @scene = PostCreditsScene.new
  end

  def create

    @scene = PostCreditsScene.new(scene_params)

    

    respond_to do |format|
      if @scene.save
        format.html { redirect_to post_credits_scenes_path }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    PostCreditsScene.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to post_credits_scenes_url }
    end
  end



  def import
    PostCreditsScene.import(params[:file])
    redirect_to root_url, notice: "Scenes imported."
  end

  private
    def scene_params
      params.require(:post_credits_scene).permit(:text)
    end

end
