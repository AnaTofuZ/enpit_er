class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def list
  end

  def friends
     @users = Profile.where(place_id: 1)
  end

  def recipe
  end

  def mailbox
  end
end
