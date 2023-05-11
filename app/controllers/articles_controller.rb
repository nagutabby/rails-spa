class ArticlesController < ApplicationController
  include Auth
  before_action :set_article, only: %i[ show update destroy ]
  skip_before_action :authenticate, only: %i[ index show ]

  # GET /articles
  def index
    render inertia: 'Articles/Index', props: {
      articles: Article.all
    }
  end

  # GET /articles/[:id]
  def show
    render inertia: 'Articles/Show', props: {
      article: @article
    }
  end

  # POST /articles
  def create
    article = Article.new(article_params)

    if article.save
      redirect_to articles_path, notice: 'Article created.'
    else
      redirect_to articles_path, inertia: { errors: article.errors }
    end
  end

  # PATCH/PUT /articles/[:id]
  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: "Article was successfully updated."
    else
      redirect_to articles_path, inertia: { errors: @article.errors }
    end
  end

  # DELETE /articles/[:id]
  def destroy
    if @article.destroy
      redirect_to articles_path, notice: "Article was successfully destroyed."
    else
      redirect_to articles_path, alert: "Article cannot be deleted!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
