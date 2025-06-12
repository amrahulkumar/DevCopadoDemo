trigger EventTrigger on Message_Event__e (after insert) {
	List<FeedItem> postLst = new List<FeedItem>();
    for(Message_Event__e evt:Trigger.New) {
		    System.debug('TestPlatformtrigger>>>');

        FeedItem post=new FeedItem();
        post.ParentId = Userinfo.getUserId();
        post.Title = 'Platform Event Post';
        post.Body = evt.Description__c;
        postLst.add(post);
  }
  
          insert postLst;
}