module GamesHelper
  def render_reward(game, category, answer)
    if answer.viewed?
      "&nbsp;".html_safe
    else
      reward = game.reward_for(answer)
      link_to( number_with_delimiter(reward.score),
               answer_path(game, category, reward) ) +
      " "                                            +
      image_tag("ruby.png")
    end
  end
end
