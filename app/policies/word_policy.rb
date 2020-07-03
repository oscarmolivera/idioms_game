class WordPolicy
  attr_reader :user, :word

  def initialize(user, word)
    @user = user
    @word = word
  end

  def edit?
    authorized_user?
  end

  def update?
    authorized_user?
  end

  def destroy?
    authorized_user?
  end

  private

  def authorized_user?
    word.user_id == user.id
  end
end
