/**
 * Singleton en Java : implémentation classique avec initialisation tardive et double verrouillage.
 */
public class ClassicSingleton {
    // L'instance n'a pas de valeur par défaut.
    private static volatile ClassicSingleton instance = null;

    private ClassicSingleton() {
        if (instance != null) throw new IllegalStateException("Trying to reinstantiate a singleton");
    }

    public static ClassicSingleton getInstance() {
        if (instance == null) {
            // Double lock sur la zone critique.
            synchronized (ClassicSingleton.class){
                if (instance == null) {
                    // L'instance n'est créée qu'au premier appel de getInstance.
                    instance = new ClassicSingleton();
                }
           }
        }
        return instance;
    }
}
