import java.lang.reflect.*;

public class TestClassicSingleton {

  /**
   * Test du ClassicSingleton et attaque avec reflect.
   */
  public static void main(String[] args) {
    ClassicSingleton inst = ClassicSingleton.getInstance();
    System.out.println(inst.hashCode());

    ClassicSingleton instBis = ClassicSingleton.getInstance();
    System.out.println(instBis.hashCode());

    //Ce passage est impossible.
    Class<?> klass = ClassicSingleton.class;
    Constructor<?> cons = klass.getDeclaredConstructors()[0];
    cons.setAccessible(true);
    try {
      ClassicSingleton instTer = (ClassicSingleton) cons.newInstance(null);
      System.out.println(instTer.hashCode());
    }
    catch (IllegalArgumentException e) { e.printStackTrace(); }
    catch (InstantiationException e) { e.printStackTrace(); }
    catch (IllegalAccessException e) { e.printStackTrace(); }
    catch (InvocationTargetException e) { e.printStackTrace(); }
  }
}
