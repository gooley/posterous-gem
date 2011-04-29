require 'helper'

describe Posterous::AsyncConnection do
  include Posterous::AsyncConnection
  
  it "should handle GET requests" do
    p get('/')
  end 

  it "should handle POST requests" do
    pending
    new_post = post('/sites/primary/posts', {
      :post => {
        :title => "from posterous", 
        :body => 'OMGWTFBBQ'
      },
      :media => { '0' => SAMPLE_IMAGE }
    })
    new_post.title.should                   == 'from posterous'
    new_post.body_full.should               =~ /OMGWTFBBQ/
    new_post.media[2]['images'].length.should  == 1
  end

  it "should handle PUT requests" do
    pending
    new_post = put('/sites/primary/posts/27561123', {
      :post => {
        :title => "from posterous", 
        :body  => 'OMGWTFBBQ'
      },
      :media => { '0' => SAMPLE_IMAGE }
    })
    new_post.title.should                   == 'from posterous'
    new_post.body_full.should               =~ /OMGWTFBBQ/
    new_post.media[2]['images'].length.should  == 1
  end


end
