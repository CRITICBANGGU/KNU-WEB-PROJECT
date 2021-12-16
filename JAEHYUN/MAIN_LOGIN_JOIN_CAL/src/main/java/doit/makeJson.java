package doit;

public class makeJson {
	 String start;
	 String end;
	 String title;
	
	public void setJson(String title, String startT, String endT) {
        this.start = startT;
        this.end = endT;
        this.title = title;
    }
	@Override
	public String toString() {
        return "{ title: " + title
                + ", start: "+ start
                + ", end: " + end + " }";
    }
}
