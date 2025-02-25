buildscript {
    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        // Ensure you have the correct version of the Android Gradle Plugin
        classpath("com.android.tools.build:gradle:7.4.0")

        // Ensure you have the correct version of the Kotlin Gradle Plugin
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.7.20")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app") // Ensures all subprojects evaluate the ':app' project
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
