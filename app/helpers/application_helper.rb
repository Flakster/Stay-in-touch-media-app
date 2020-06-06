# frozen_string_literal: true

module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def can_request_friendship?(receiver_id)
    Friendship.friendship(current_user.id, receiver_id).count.zero?
  end

  def provider_name(provider)
    if provider == 'google_oauth2'
      'google'
    else
      provider
    end
  end

  def provider_order(provider)
    if provider == 'facebook'
      1
    elsif provider == 'google_oauth2'
      2
    elsif provider == 'github'
      3
    end
  end
end
