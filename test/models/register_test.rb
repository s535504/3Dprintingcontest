require 'test_helper'

class RegisterTest < ActiveSupport::TestCase

  def setup
    @register = Register.new(name: "羅那", email: "rona@gmail.com")
  end

  test "should be valid" do
    assert @register.valid?
  end

  test "name should be present" do
    @register.name = "  "
    assert_not @register.valid?
  end

  test "email should be present" do
    @register.name = "  "
    assert_not @register.valid?
  end

  test "name should not be too long" do
    @register.name = "a" * 51
    assert_not @register.valid?
  end

  test "email should not be too long" do
    @register.email = "a" * 244 + "@example.com"
    assert_not @register.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @register.email = valid_address
      assert @register.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @register.dup
    duplicate_user.email = @register.email.upcase
    @register.save
    assert_not duplicate_user.valid?
  end
end
