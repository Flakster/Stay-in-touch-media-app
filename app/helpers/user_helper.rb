# frozen_string_literal: true

module UserHelper
  def request_friendship_caller_set(page)
    cookies[:caller_page] = page
  end

  def request_friendship_caller
    cookies[:caller_page]
  end
end