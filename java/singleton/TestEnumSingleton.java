import java.lang.reflect.*;

public class TestEnumSingleton {

  /**
   * Test du EnumSingleton et attaque avec reflect.
   */
  public static void main(String[] args) {
    EnumSingleton inst = EnumSingleton.getInstance();
    System.out.println(inst.hashCode());

    EnumSingleton instBis = EnumSingleton.getInstance();
    System.out.println(instBis.hashCode());

    // Ce passage est impossible.
    // Class<EnumSingleton> klass = EnumSingleton.class;
    // EnumSingleton s2 = klass.getDeclaredConstructor().newInstance();
  }
}
