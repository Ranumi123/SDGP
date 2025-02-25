plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.mental_app1"
    compileSdk = 34
    
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.mental_app1"
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    ndkVersion = "27.0.12077973"

    buildTypes {
        release {
            isMinifyEnabled = true // Enable code shrinking
            isShrinkResources = true // Changed from shrinkResources to isShrinkResources
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            signingConfig = signingConfigs.getByName("debug")
        }
        debug {
            isMinifyEnabled = false // Disable minification for debug builds
            isShrinkResources = false // Changed from shrinkResources to isShrinkResources
        }
    }
}

flutter {
    source = "../.."
}