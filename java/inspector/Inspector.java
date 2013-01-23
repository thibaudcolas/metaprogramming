import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;

/**
 * Inspecteur d'objets en Java : utilise la librairie standard reflect
 * pour visualiser les attributs et méthodes d'une classe.
 */

public class Inspector {
	private Inspector() {}

	private static String pp(Object o) {
		return o.toString().replace("java.lang.","");
	}

	public static void inspect(Object o) {
		Class<? extends Object> oClass = o.getClass();

		// Affichage des infos d'instanciation et d'héritage de o.
		System.out.println("Objet " + pp(o) + " — Classe qu'il instancie : " + oClass);
		System.out.println("— Type dynamique : " + oClass.getName());
		System.out.println("— Superclasse : " + pp(oClass.getGenericSuperclass()));

		// Fields contient tous les fields, hérités et introduits.
		System.out.println("— Attributs hérités :");
		Field[] fields = oClass.getFields();
		for (Field f : fields) {
			System.out.println(pp(f));
		}

		// Ici ce ne sont que les attributs introduits par la classe de o.
		System.out.println("— Attributs introduits :");
		fields = oClass.getDeclaredFields();
		for (Field f : fields) {
			System.out.println(pp(f));
		}

		System.out.println("— Méthodes :");
		Method[] methods = oClass.getDeclaredMethods();
		for (Method m : methods) {
			System.out.println(m);
		}

		System.out.println("— Constructeurs :");
		Constructor<?>[] constructors = oClass.getDeclaredConstructors();
		for (int j = 0; j < constructors.length; j++) {
			System.out.println(constructors[j]);
		}
	}
}


