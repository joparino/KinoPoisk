package io.joparino.medialibrary

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform