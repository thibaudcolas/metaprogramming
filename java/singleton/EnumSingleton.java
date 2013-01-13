
/**
 * Singleton en Java (> 1.5) en utilisant enum.
 * Avantages :
 * - ne peut être attaqué avec la réflexion (pas de newInstance sur enum, pas de setAccessible(true) sur le new)
 * - facilement sérializable
 * - aucun soucis de synchronisation / concurence
 * Désavantages :
 * - pas d'héritage
 * - ne fonctionne qu'à partir de Java 5
 */
public enum EnumSingleton {
    INSTANCE;
    public static EnumSingleton getInstance() {
        return INSTANCE;
    }
}
