# EvenEnOneven — SwiftUI

## Wat doet de app?
De app laat de gebruiker een geheel getal invoeren. Vervolgens verschijnt **even** of **oneven**. De gebruiker hoeft niet op een knop te drukken: door `@State` werkt de interface automatisch bij.

## Bestanden
- `EvenEnOnevenApp.swift`: de toegang tot de app. `@main` duidt het startpunt aan. `WindowGroup { ContentView() }` toont het hoofdscherm.
- `ContentView.swift`: schermopbouw, gebruikersinvoer, validatie en de berekening.
- `Assets.xcassets/`: plek voor appafbeeldingen en andere visuele bestanden.
- `EvenEnOneven.xcodeproj/`: instellingen van het Xcode-project.

## Stap voor stap
1. `@State private var invoer = ""` bewaart de tekst die de gebruiker invoert.
2. `TextField(..., text: $invoer)` koppelt het invoerveld aan die variabele. De dollar geeft aan dat de waarde in beide richtingen verbonden is (een *binding*).
3. `trimmingCharacters(in: .whitespacesAndNewlines)` verwijdert spaties aan begin en einde.
4. `Int(...)` zet geldige tekst om naar een geheel getal. Bij ongeldige tekst geeft dit `nil`.
5. `guard let` controleert of die omzetting gelukt is.
6. `waarde % 2` berekent de rest van de deling door twee. Rest **0** betekent **even**, anders **oneven**.
7. `Text(resultaat)` toont de uitleg of foutmelding op het scherm.

## Testgevallen
| Invoer | Verwacht resultaat |
| --- | --- |
| `4` | `4 is even.` |
| `7` | `7 is oneven.` |
| `0` | `0 is even.` |
| `-6` | `-6 is even.` |
| `abc` | Foutmelding: geheel getal vereist |
| leeg | Aanmoediging om een getal in te vullen |

## Wat is voltooid?
De standaard-"Hello, world!"-weergave is vervangen door een concrete oefening die past bij de bestaande projectnaam. Er is geen originele opdrachtomschrijving aanwezig, dus dit is **een redelijke voorbeeldimplementatie**, niet een bevestigde uitwerking van een leerkrachtopdracht.

## Controle
De code is statisch beoordeeld. Een echte Xcode-build, uitvoering op iPhone/iPad en toegankelijkheidstest zijn nog nodig; die konden niet worden uitgevoerd via deze GitHub-verbinding.
