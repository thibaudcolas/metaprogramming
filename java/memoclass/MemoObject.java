
import java.util.ArrayList;

/* MemoObject, la classe des objets qui sont mémorisés par leurs classes. */
public class MemoObject {

  private static ArrayList<MemoObject> instances = new ArrayList<MemoObject>();

  private MemoObject() {}
  
  public static MemoObject getInstance() {
	  MemoObject mo;
	  synchronized (instances) {
		  mo = new MemoObject();
		  instances.add(mo);
	  }
	  
	  return mo;
  }
  
  public static ArrayList<? extends MemoObject> getInstances() {
    return instances;
  }
  
  public static void main(String[] args) {
	  MemoObject o = MemoObject.getInstance();
	  MemoObject m = MemoObject.getInstance();
	  System.out.println(o);
	  System.out.println(m);
	  System.out.println(MemoObject.getInstances());
	  System.out.println(MemoObject.getInstances());
  }
}
