package com.tonypepe.fsb.data

import org.jetbrains.exposed.sql.Column
import org.jetbrains.exposed.sql.Table


data class ShopItem(
    val id: Int? = null,
    val name: String = "",
    val description: String = "",
    val price: Int = 0,
    val count: Int = 0,
    val imageUrl: String = "",
)

object ShopItemTable : Table() {
    val id: Column<Int> = integer("id").autoIncrement()
    val name: Column<String> = varchar("name", 100)
    val description: Column<String> = varchar("description", 150)
    val price: Column<Int> = integer("price")
    val count: Column<Int> = integer("count")
    val imageUrl: Column<String> = varchar("imageUrl", 150)

    override val primaryKey: PrimaryKey = PrimaryKey(id)
}
