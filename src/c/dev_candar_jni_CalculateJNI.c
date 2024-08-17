#include <jni.h>

JNIEXPORT jint JNICALL Java_dev_candar_jni_CalculateJNI_multiply(JNIEnv *env, jobject thisObj, jint a, jint b) {
	return a * b;
}

