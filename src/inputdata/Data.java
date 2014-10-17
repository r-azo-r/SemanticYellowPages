package inputdata;

	import java.util.ArrayList;
	import org.json.simple.JSONAware;
	import org.json.simple.JSONObject;

public 	class Data implements JSONAware
	{
		public String relation;
		public Data(String relation)
		{
			this.relation = relation;
		}
		 public String toJSONString(){
	         StringBuffer sb = new StringBuffer();
	         
	         sb.append("{");
	         
	         sb.append(JSONObject.escape("relation"));
	         sb.append(":");
	         sb.append("\"" + JSONObject.escape(relation) + "\"");
	       //  sb.append(relation);
	         sb.append("}");
	         
	         return sb.toString();
	 }
		 public String toString(){
	         StringBuffer sb = new StringBuffer();
	         
	         sb.append("{");
	         
	         sb.append(JSONObject.escape("relation"));
	         sb.append(":");
	         sb.append("\"" + JSONObject.escape(relation) + "\"");
	         
	         sb.append("}");
	         
	         return sb.toString();
	 }
	}


