require 'test_helper'

class AddisthaMailerTest < ActionMailer::TestCase
  test "newuser_confirmation" do
    mail = AddisthaMailer.newuser_confirmation
    assert_equal "Newuser confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "bidcomplete" do
    mail = AddisthaMailer.bidcomplete
    assert_equal "Bidcomplete", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "purchase_confirmation" do
    mail = AddisthaMailer.purchase_confirmation
    assert_equal "Purchase confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
