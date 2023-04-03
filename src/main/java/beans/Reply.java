package beans;

public class Reply {

    private String userName;
    private String content;
    private String postid;

    public Reply() {
    }

    public Reply(String userName, String content) {
        this.userName = userName;
        this.content = content;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    public String getPostid() {
        return postid;
    }

    public void setPostid(String postid) {
        this.postid = postid;
    }


    @Override
    public String toString() {
        return "Reply{" +
                "userName='" + userName + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
