package doit;
import org.json.simple.JSONObject; 
import org.json.simple.parser.JSONParser; 
import org.json.simple.parser.ParseException;


public class Doit {
	private String userID;
	JSONObject dolist = new JSONObject();
	JSONObject friendslist = new JSONObject();
	private String date;
	private String startT;
	private String endT;
	private String doIT;
	
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStartT() {
		return startT;
	}
	public void setStartT(String startT) {
		this.startT = startT;
	}
	public String getEndT() {
		return endT;
	}
	public void setEndT(String endT) {
		this.endT = endT;
	}
	public String getDoIT() {
		return doIT;
	}
	public void setDoIT(String doIT) {
		this.doIT = doIT;
	}
	
}
