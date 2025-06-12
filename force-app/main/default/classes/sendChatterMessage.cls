//Class to send a chatter post to a user
//input - userId, message string
//output - Chatter feed item created - USING FeedItem object
public class sendChatterMessage {
    
    public static void sendChatter(String message){
        FeedItem post = new FeedItem();
        post.ParentId = UserInfo.getUserId();
        post.Body = message;
        insert post;
    }

}