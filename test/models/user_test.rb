require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(
      name: 'Samir Marin', 
      email: 'marin.samir@mail.com',
      password: 'thepassword',
      password_confirmation: 'thepassword',
    )
  end

  test 'User can have name and email' do
    assert_predicate @user, :validate
  end

  test 'user must have name' do
    @user.name = nil
    refute_predicate @user, :validate
  end

  test 'user must have email' do
    @user.email = nil
    refute_predicate @user, :validate
  end

  test 'user email must be valid' do
    @user.email = 'invalidemail'
    refute_predicate @user, :validate
  end

  test 'user must have a password and must be be minium 6 chars' do
    @user.password = nil
    refute_predicate @user, :validate

    @user.password = "not"
    refute_predicate @user, :validate
  end
end
