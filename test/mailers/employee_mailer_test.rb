require 'test_helper'

class EmployeeMailerTest < ActionMailer::TestCase
  setup do
    @complaint_redirected_email = EmployeeMailer.complaint_redirected_email(complaints(:one))
  end

  test 'complaint redirected email should queue' do
    assert_emails 1 do
      @complaint_redirected_email.deliver_now
    end
  end

  test 'complaint redirected email should have the correct from field' do
    assert_equal ['mejoratech2017@gmail.com'], @complaint_redirected_email.from
  end

  test 'complaint redirected email should have the correct to field' do
    assert_equal [employees(:one).email], @complaint_redirected_email.to
  end

  test 'complaint redirected email should have the correct subject' do
    assert_equal 'New complaint investigation assigned',
                 @complaint_redirected_email.subject
  end

  test 'complaint redirected email should have the correct body' do
    assert_equal read_fixture('complaint_redirected_email').join,
                 @complaint_redirected_email.text_part.body.to_s
  end
end
