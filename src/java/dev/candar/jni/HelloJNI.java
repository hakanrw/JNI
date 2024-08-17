package dev.candar.jni;

public class HelloJNI {
    // Declare a native method that is implemented in a C file
    public native String sayHello(String name);

    // Load the shared library (.so/.dll) that contains the native method
    static {
        System.loadLibrary("hello"); // 'hello' is the name of the shared library
    }

    // Main method to test the native method
    public static void main(String[] args) {
        HelloJNI helloJNI = new HelloJNI();
        String result = helloJNI.sayHello("World");
        System.out.println("Result from C: " + result);

        CalculateJNI calculateJNI = new CalculateJNI();
        System.out.println("Result from C: " + calculateJNI.multiply(3, 4));
    }
}
