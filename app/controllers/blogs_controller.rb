class BlogsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    # formからなデータを受け取る
    @post = Post.new(post_params)
    # これを保存する
    @post.save #saveをしたら、id, created_at, updated_atが加えられる
    # show.html.erbに飛ばす
    redirect_to "/blogs/#{@post.id}"
  end



  private
  def post_params
        # params.require(:key).permit(:filter)
    params.require(:post).permit(  #フォームに入力されたデータを取得して、フィルタリング
      :title,
      :category,
      :body
    )
  end
end
