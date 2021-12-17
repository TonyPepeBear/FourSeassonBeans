package com.tonypepe.fsb.plugins

import com.tonypepe.fsb.data.AppDatabase
import com.tonypepe.fsb.data.ShopItem
import io.ktor.application.*
import io.ktor.features.*
import io.ktor.gson.*
import io.ktor.http.*
import io.ktor.request.*
import io.ktor.response.*
import io.ktor.routing.*

fun Application.configureRouting() {
    install(ContentNegotiation) {
        gson {
            setPrettyPrinting()
        }
    }

    routing {
        get {
            call.respond("Four Season Beans")
        }
        route("shop_item") {
            get {
                call.respond(
                    AppDatabase.getAllShopItem()
                )
            }
            post("add") {
                try {
                    val item = call.receive<ShopItem>()
                    AppDatabase.addShopItem(item)
                    call.respond(HttpStatusCode.OK)
                } catch (e: Exception) {
                    call.respond(HttpStatusCode.BadRequest, e.message.toString())
                }
            }
            post("adds") {
                try {
                    val items = call.receive<Array<ShopItem>>()
                    items.forEach { item ->
                        AppDatabase.addShopItem(item)
                    }
                    call.respond(HttpStatusCode.OK)
                } catch (e: Exception) {
                    call.respond(HttpStatusCode.BadRequest, e.message.toString())
                }
            }
        }
    }
}
