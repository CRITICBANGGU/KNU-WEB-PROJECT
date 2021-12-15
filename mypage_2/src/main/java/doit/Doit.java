package doit;
import org.json.simple.JSONObject; 
import org.json.simple.parser.JSONParser; 
import org.json.simple.parser.ParseException;


public class Doit {
	private String userID;
	JSONObject dolist = new JSONObject();
	JSONObject friendslist = new JSONObject();
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public JSONObject getDolist() {
		return dolist;
	}
	public void setDolist(JSONObject dolist) {
		this.dolist = dolist;
	}
	public JSONObject getFriendslist() {
		return friendslist;
	}
	public void setFriendslist(JSONObject friendslist) {
		this.friendslist = friendslist;
	}
	
}
