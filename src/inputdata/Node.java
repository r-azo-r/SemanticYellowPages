package inputdata;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

public class Node implements JSONAware
{
	public int id;
	public String name;
	public Data data;
	public Node parent;
	public Node(int id,String name,Data data,Node parent)
	{
		this.id = id;
		this.name = name;
		this.data = data;
		this.parent = parent;
	}
	public String toJSONString(){
        StringBuffer sb = new StringBuffer();
        
        sb.append("{");
        
        sb.append(JSONObject.escape("id"));
        sb.append(":");
        sb.append(id);
        sb.append(",");
        
        sb.append(JSONObject.escape("name"));
        sb.append(":");
        sb.append("\"" + JSONObject.escape(name) + "\"");
     //   sb.append(name);
        sb.append(",");
        
        sb.append(JSONObject.escape("data"));
        sb.append(":");
        sb.append(data.toJSONString());
        
        
        if(parent !=null)
        {
        	sb.append(",");
            sb.append(JSONObject.escape("adjacencies"));
            sb.append(":");
            sb.append("[");
            sb.append("{");
        	sb.append(JSONObject.escape("nodeTo"));
        	sb.append(":");
        	sb.append("\""+parent.id+"\"");
        	//sb.append(parent.id);
        	sb.append("}");
            sb.append("]");
        }
        
        sb.append("}");
        
        return sb.toString();
}
	@Override
	public String toString()
	{
		 StringBuffer sb = new StringBuffer();
	        
	        sb.append("{");
	        
	        sb.append(JSONObject.escape("id"));
	        sb.append(":");
	        sb.append(id);
	        sb.append(",");
	        
	        sb.append(JSONObject.escape("name"));
	        sb.append(":");
	        sb.append("\"" + JSONObject.escape(name) + "\"");
	        
	        sb.append(",");
	        
	        sb.append(JSONObject.escape("data"));
	        sb.append(":");
	        sb.append(data.toJSONString());
	        
	        sb.append("}");
	        
	        return sb.toString();
	}
}

