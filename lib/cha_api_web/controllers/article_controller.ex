defmodule ChaApiWeb.ArticleController do
  use ChaApiWeb, :controller

  alias ChaApi.Events
  alias ChaApi.Events.Article

  action_fallback ChaApiWeb.FallbackController


  def index(conn, %{"event_id" => event_id}) do
    event = Events.get_event!(event_id)
    render(conn, "index.json", articles: event.articles)
  end


  def create(conn, %{"event_id" => event_id, "article" => article_params}) do
    event = Events.get_event!(event_id)

    with {:ok, %Article{} = article} <- Events.create_article(event, article_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.event_article_path(conn, :show, event_id, article))
      |> render("show.json", article: article)
    end
  end

  def show(conn, %{"id" => id}) do
    article = Events.get_article!(id)
    render(conn, "show.json", article: article)
  end

  def update(conn, %{"id" => id, "article" => article_params}) do
    article = Events.get_article!(id)

    with {:ok, %Article{} = article} <- Events.update_article(article, article_params) do
      render(conn, "show.json", article: article)
    end
  end

  def delete(conn, %{"id" => id}) do
    article = Events.get_article!(id)

    with {:ok, %Article{}} <- Events.delete_article(article) do
      send_resp(conn, :no_content, "")
    end
  end
end
