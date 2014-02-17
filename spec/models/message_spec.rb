require 'spec_helper'

describe LegislativeMessageRepresenter do
  it "has a method from_json " do
    message = LegislativeMessageRepresenter.new
    message_json = '{"subject":"subject","content":"content","recipients":"recipients","remote_id":"remote_id","author_name":"author_name","author_email":"author_email"}'
    message.from_json(message_json)

    message.subject.should eql "subject"
    message.content.should eql "content"
    message.remote_id.should eql "remote_id"
    message.author_name.should eql "author_name"
    message.author_email.should eql "author_email"
  end
end

describe LegislativeMessageCollection do
  before(:each) do
    value = %x( ./writeit_for_testing/writeit_install_yaml.bash )
  end
  xit "it gets the messages from the server" do
    collection = LegislativeMessageCollection.new
    collection.get

    collection.objects.length.should eql 1
    message = collection.objects[0]
    message.should be_an_instance_of LegislativeMessageRepresenter
    message.subject.should eql 'subject 1'
    message.content.should eql 'Content 1'


  end
end

