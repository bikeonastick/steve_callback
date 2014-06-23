import java.lang.reflect.Method;

public class Caller {
  public static void main(String args[]) {
    callbackTest(args[0]);
  }

  static void callbackTest(String classname) {
    System.out.println("[Caller] args = " + classname);
    try {
      System.out.print("[Caller] calling class method on ");
      System.out.println(classname);
      Class c = Class.forName(classname);
      System.out.print("[Caller] class = ");
      System.out.println(c);
      Object o = c.newInstance();
      Method m = c.getMethod("hello");
      m.invoke(null);

    } catch(Exception e) {
      System.out.println("[Caller] failed to invoke class method");
      System.out.print("[Caller] ");
      System.out.println(e);

      try {
        Class c2 = Class.forName(classname);
        Object o2 = c2.newInstance();
        Method m2 = c2.getMethod("hello");
        m2.invoke(o2);
      } catch(Exception e2) {
        System.out.println("[Caller] failed to invoke object method");
        System.out.print("[Caller] ");
        System.out.println(e2);
      }
    }
  }
}
