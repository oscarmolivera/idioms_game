class GamePolicy
  attr_reader :user, :game

  def initialize(user, game)
    @user = user
    @game = game
  end

  def show?
    authorized_user?
  end

  private

  def authorized_user?
    game.user_id == user.id
  end
end
