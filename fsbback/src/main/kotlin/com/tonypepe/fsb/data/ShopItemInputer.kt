package com.tonypepe.fsb.data

import com.opencsv.CSVReader
import io.ktor.client.*
import io.ktor.client.features.json.*
import io.ktor.client.request.*
import io.ktor.client.statement.*
import io.ktor.http.*
import kotlinx.coroutines.runBlocking
import java.io.FileReader

fun main() {
    inputByCsv()
}

fun inputByCsv() = runBlocking {
    val client = HttpClient {
        install(JsonFeature) {
            serializer = GsonSerializer()
        }
    }
    val filePath = "db_shop_item_sample_data.csv"
    val reader = CSVReader(FileReader(filePath))
    reader.readNext()
    var line: Array<String>? = reader.readNext()
    while (line != null) {
        client.post<HttpResponse>("http://localhost:8080/shop_item/add") {
            contentType(ContentType.Application.Json)
            body = ShopItem(
                name = line?.get(0) ?: "",
                description = line?.get(1) ?: "",
                price = line?.get(2)?.toIntOrNull() ?: 0,
                imageUrl = line?.get(3) ?: ""
            )
        }
        line = reader.readNext()
    }
}

