package com.tonypepe.fsb.data

import org.jetbrains.exposed.sql.Database
import org.jetbrains.exposed.sql.SchemaUtils
import org.jetbrains.exposed.sql.insert
import org.jetbrains.exposed.sql.selectAll
import org.jetbrains.exposed.sql.transactions.transaction

object AppDatabase {
    private var isInit = false

    private fun initAppDatabase() {
        if (isInit) return
        Database.connect(
            url = "jdbc:mysql://localhost:3306/fsb",
            driver = "com.mysql.cj.jdbc.Driver",
            user = "root",
            password = "PWD",
        )
        transaction {
            SchemaUtils.create(ShopItemTable)
        }
        isInit = true;
    }

    fun getAllShopItem(): List<ShopItem> {
        initAppDatabase()
        val list = mutableListOf<ShopItem>()
        transaction {
            ShopItemTable.selectAll().map {
                @Suppress("RemoveRedundantQualifierName")
                list.add(
                    ShopItem(
                        name = it[ShopItemTable.name],
                        description = it[ShopItemTable.description],
                        price = it[ShopItemTable.price],
                        count = it[ShopItemTable.count],
                        imageUrl = it[ShopItemTable.imageUrl],
                    )
                )
            }
        }
        return list
    }

    fun addShopItem(item: ShopItem) {
        initAppDatabase()
        transaction {
            ShopItemTable.insert {
                it[name] = item.name
                it[description] = item.description
                it[price] = item.price
                it[count] = item.count
                it[imageUrl] = item.imageUrl
            }
            commit()
        }
    }
}
