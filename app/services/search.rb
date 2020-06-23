module Search

  class SearchArticle

    def initialize(params)
      @params = params
      @title = Article.arel_table[:title]
      @content = Article.arel_table[:content]
    end

    def find
      if(@params.has_key?(:search))
        Article.where(@content.matches("%#{@params[:search]}%"))
               .or(Article.where(@title.matches("%#{@params[:search]}%")))
               .paginate(page: @params[:page],per_page:5)
      else
        Article.paginate(page: @params[:page],per_page:5)
      end
    end
  end
end