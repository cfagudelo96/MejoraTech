require 'test_helper'

class SupportTest < ActiveSupport::TestCase
  test 'should not save without description' do
    support = Support.new(support_file: File.open("#{Rails.root}/test/fixtures/files/SupportFile.txt"),
                          complaint_id: complaints(:one).id)
    assert_not support.save
  end

  test 'should not save without support_file' do
    support = Support.new(description: 'Test',
                          complaint_id: complaints(:one).id)
    assert_not support.save
  end

  test 'should not save without a complaint' do
    support = Support.new(support_file: File.open("#{Rails.root}/test/fixtures/files/SupportFile.txt"),
                          description: 'Test')
    assert_not support.save
  end

  test 'should save' do
    support = Support.new(support_file: File.open("#{Rails.root}/test/fixtures/files/SupportFile.txt"),
                          description: 'Test',
                          complaint_id: complaints(:one).id)
    assert support.save
  end
end
