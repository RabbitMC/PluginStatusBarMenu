#Abstract

In diesem kurzen Artikel zeige ich wie man eine macOS StatusBar Applikation mit einer Plug-In Architektur implementiert. Das hat zur folge, dass man verschiedene Funktionalitäten Modulbasiert vorhalten kann.

#Ablauf

Die Host Applikation scannt beim Start einen vordefinierten Ordner (z. B. ~/Library/Application Support/MacMenuBarHost/PlugIns). Befinden sich dort .bundle Dateien werden diese geladen und überprüft. Ist das Plugin-Bundle konform zu einem vorher definierten Protocol so wird das Plugin von der Host Applikation geladen.

[Blog Post](https://miralem-cebic.de/blog/index.php?controller=post&action=view&id_post=2)
