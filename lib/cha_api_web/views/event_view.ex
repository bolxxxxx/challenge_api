defmodule ChaApiWeb.EventView do
  use ChaApiWeb, :view
  alias ChaApiWeb.{EventView, ArticleView}

  def render("index.json", %{events: events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, EventView, "event_with_articles.json")}
  end

#  def render("event.json", %{event: event}) do
#    %{id: event.id,
#      title: event.title}
#  end
  def render("event_with_articles.json", %{event: event}) do
    %{
      id: event.id,
      title: event.title,
      articles: render_many(event.articles, ArticleView, "article.jsom")
    }
  end
end
