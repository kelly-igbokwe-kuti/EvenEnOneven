//
//  ContentView.swift
//  EvenEnOneven
//
//  Een eenvoudige SwiftUI-oefening: controleer of een geheel getal even of oneven is.
//

// SwiftUI is het Apple-framework voor interfaces die uit View-elementen bestaan.
import SwiftUI

// struct maakt een eigen View-type; SwiftUI roept body aan om het scherm op te bouwen.
struct ContentView: View {
    // @State bewaart de invoer. SwiftUI werkt de interface bij wanneer deze waarde wijzigt.
    // private voorkomt toegang van buiten ContentView; $invoer geeft een tweerichtingskoppeling.
    @State private var invoer = ""

    // Int(...) probeert de tekst om te zetten naar een geheel getal.
    // Bij ongeldige invoer (bv. "abc" of "2,5") wordt de waarde nil.
    // Dit is een berekende eigenschap, geen opgeslagen tweede variabele.
    // Het vraagteken in Int? betekent dat de omzetting mag mislukken (nil).
    private var getal: Int? {
        Int(invoer.trimmingCharacters(in: .whitespacesAndNewlines))
    }

    private var resultaat: String {
        // Een leeg veld is niet hetzelfde als een foutief ingevuld getal.
        if invoer.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return "Vul een geheel getal in."
        }

        // guard let pakt de geldige Int uit de optionele waarde; anders verlaten we dit blok.
        guard let waarde = getal else {
            return "Ongeldige invoer: gebruik een geheel getal."
        }

        // De rest bij delen door 2 is 0 voor alle even getallen.
        // Ook negatieve even getallen, bijvoorbeeld -4, voldoen hieraan.
        // % geeft de rest na deling. De ternary ? : kiest één van twee teksten.
        // \(waarde) voegt het berekende getal als tekst in de zin in.
        return waarde % 2 == 0
            ? "\(waarde) is even."
            : "\(waarde) is oneven."
    }

    // body is de beschrijving van de interface. some View betekent: één concreet View-type.
    var body: some View {
        // VStack zet elementen verticaal onder elkaar; spacing is de ruimte in punten.
        VStack(spacing: 20) {
            // SF Symbols is de bibliotheek met ingebouwde Apple-pictogrammen.
            Image(systemName: "number.square.fill")
                .font(.system(size: 50))
                .foregroundStyle(.tint)
                .accessibilityHidden(true)

            Text("Even of oneven?")
                .font(.largeTitle.bold())

            Text("Voer een geheel getal in en ontdek het resultaat.")
                .multilineTextAlignment(.center)

            // Deze TextField schrijft elke wijziging rechtstreeks naar @State invoer.
            // keyboardType vraagt een passend toetsenbord, maar valideert de tekst niet zelf.
            TextField("Bijvoorbeeld 42", text: $invoer)
                .keyboardType(.numbersAndPunctuation)
                .textFieldStyle(.roundedBorder)
                .accessibilityLabel("Geheel getal")

            // De berekende eigenschap resultaat reageert automatisch op de nieuwe invoer.
            Text(resultaat)
                .font(.title3)
                .bold()
                .accessibilityIdentifier("resultaat")
        }
        .padding()
    }
}

// Xcode kan deze View vooraf tonen zonder de volledige app te starten.
#Preview {
    ContentView()
}
