package com.tonypepe.fsb

import com.tonypepe.fsb.plugins.*
import io.ktor.server.engine.*
import io.ktor.server.netty.*

fun main() {
    embeddedServer(Netty, port = 8080, host = "0.0.0.0") {
        configureRouting()
        configureSecurity()
        configureHTTP()
        configureTemplating()
        configureSerialization()
    }.start(wait = true)
}
