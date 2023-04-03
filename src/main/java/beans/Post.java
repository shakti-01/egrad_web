package beans;
import java.util.ArrayList;

public class Post {

    private String postid;
    private String userName;
    private String title;
    private String content;
    private ArrayList<Reply> replies;

    public Post() {
    }

    public Post(String postid, String userName, String title, String content, ArrayList<Reply> replies) {
        this.postid = postid;
        this.userName = userName;
        this.title = title;
        this.content = content;
        this.replies = replies;
    }

    public String getPostid() {
        return postid;
    }

    public void setPostid(String postid) {
        this.postid = postid;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public ArrayList<Reply> getReplies() {
        return replies;
    }

    public void setReplies(ArrayList<Reply> replies) {
        this.replies = replies;
    }

    @Override
    public String toString() {
        return "Post{" +
                "postid='" + postid + '\'' +
                ", userName='" + userName + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", replies=" + replies +
                '}';
    }
}
