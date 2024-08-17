package dev.candar.jni;

public class CalculateJNI {
    // Declare a native method that is implemented in a C file
    public native int multiply(int x, int y);

    // Load the shared library (.so/.dll) that contains the native method
    static {
        System.loadLibrary("hello"); // 'hello' is the name of the shared library
    }
}
