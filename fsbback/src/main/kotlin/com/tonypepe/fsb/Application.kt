package com.tonypepe.fsb

import com.tonypepe.fsb.plugins.configureRouting
import io.ktor.application.*
import io.ktor.features.*
import io.ktor.http.*
import io.ktor.server.engine.*
import io.ktor.server.netty.*

fun main() {
    embeddedServer(Netty, port = 8080, host = "0.0.0.0") {
        install(CORS) {
            anyHost()
            header(HttpHeaders.ContentType)
        }
        configureRouting()
    }.start(wait = true)
}
