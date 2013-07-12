module GamesHelper
  def render_score(score, link)
    link_to(number_with_delimiter(score), link) +
    " "                                         +
    image_tag("ruby.png")
  end

  def render_reward(game, category, answer)
    if answer.viewed?
      "&nbsp;".html_safe
    else
      reward = game.reward_for(answer)
      render_score(reward.score, answer_path(game, category, reward))
    end
  end
end
