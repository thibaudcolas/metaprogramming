import java.util.ArrayList;


public class Test {

	public static void main(String[] args) {

		Person p = new Person("John", "Cop");
		Inspector.inspect(p);

    Student s = new Student("Jack", 245);
    Inspector.inspect(s);

    Sophomore so = new Sophomore("Jill");
    Inspector.inspect(so);
	}

}
