//
//  EvenEnOnevenApp.swift
//  EvenEnOneven
//
//  Created by Kelly Igbokwe Kuti on 12/10/2026.
//

// Import zorgt dat App, Scene en WindowGroup beschikbaar worden.
import SwiftUI

// @main markeert het startpunt van de app; dit wordt maar één keer gebruikt.
@main
// Het App-protocol vraagt een body die één of meer scènes beschrijft.
struct EvenEnOnevenApp: App {
    // Een Scene beschrijft welke vensters de toepassing beheert.
    var body: some Scene {
        // WindowGroup maakt het appvenster; de eerste zichtbare pagina is ContentView.
        WindowGroup {
            ContentView()
        }
    }
}
