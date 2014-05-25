require 'spec_helper'

describe CatarseMailchimp::API do
  before do
    fake_mailchimp = mock();
    fake_mailchimp.stubs(:list_batch_subscribe).returns('list_batch_subscribe')
    fake_mailchimp.stubs(:list_batch_unsubscribe).returns('list_batch_unsubscribe')

    Mailchimp::API.stubs(:new).returns(fake_mailchimp)
  end
  
  let(:user) {
    user = mock()
    user.stubs(:email).returns('lorem@lorem.com')
    user.stubs(:name).returns('Foo bar')
    user
  }

  subject do    
    { EMAIL: user.email, NAME: user.name }
  end

  context '.subscribe' do
    it 'when user want to receive a newsletter, should update on mailchimp list' do
      instance = CatarseMailchimp::API.subscribe(subject, 'LISTID')
      instance.should == 'list_batch_subscribe'
    end
  end

  context '.unsubscribe' do
    subject do
      user = mock()
      user.stubs(:email).returns('lorem@lorem.com')
      user
    
      [ user.email ]
    end    
    
    it 'when user want to not receive a newsletter, should update on mailchimp list' do
      instance = CatarseMailchimp::API.unsubscribe(subject, 'LISTID')
      instance.should == 'list_batch_unsubscribe'
    end
  end
end
