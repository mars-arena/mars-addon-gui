package io.github.warraft.ujapi_gui

import io.github.warraft.mpq4j.MPQ4J
import java.nio.file.Files
import java.nio.file.Paths
import java.nio.file.StandardCopyOption

fun main() {
    val umswe = Paths.get("dist", "umswe.mpq")
    Files.copy(Paths.get("data", "umswe.mpq"), umswe, StandardCopyOption.REPLACE_EXISTING)

    println(umswe)

    val mpq = MPQ4J(umswe)

    val folder = Paths.get("data", "umswe", "UI").toFile()
    for (file in folder.listFiles()!!) {
        mpq.insertFile("UI/${file.name}", file, true)
    }

    mpq.close()

}
