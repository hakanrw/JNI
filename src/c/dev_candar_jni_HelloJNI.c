#include <jni.h>
#include <stdio.h>
#include "dev_candar_jni_HelloJNI.h"

// Implement the native method
JNIEXPORT jstring JNICALL Java_dev_candar_jni_HelloJNI_sayHello(JNIEnv *env, jobject thisObj, jstring name) {
    const char *nameChars = (*env)->GetStringUTFChars(env, name, 0);
    char message[128];
    sprintf(message, "Hello, %s from C!", nameChars);

    (*env)->ReleaseStringUTFChars(env, name, nameChars);
    return (*env)->NewStringUTF(env, message);
}
