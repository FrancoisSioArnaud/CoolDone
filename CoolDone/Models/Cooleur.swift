//
//  Cooleur.swift
//  CoolDone
//
//  Created by François Arnaud on 31/05/2026.
//

enum CooleurVariant: String, Codable, Equatable {
    case dark
    case bright
    case pastel
}

enum Cooleur: String, CaseIterable, Codable, Equatable, Identifiable {
    case mint
    case sage
    case lavender
    case lilac
    case softBlue
    case sky
    case turquoise
    case softPeach
    case paleApricot
    case creamYellow
    case powderPink
    case pearl

    var id: String {
        rawValue
    }

    var displayName: String {
        switch self {
        case .mint:
            return "Menthe"
        case .sage:
            return "Sauge"
        case .lavender:
            return "Lavande"
        case .lilac:
            return "Lilas"
        case .softBlue:
            return "Bleu doux"
        case .sky:
            return "Ciel"
        case .turquoise:
            return "Turquoise"
        case .softPeach:
            return "Pêche douce"
        case .paleApricot:
            return "Abricot pâle"
        case .creamYellow:
            return "Jaune crème"
        case .powderPink:
            return "Rose poudré"
        case .pearl:
            return "Perle"
        }
    }

    var darkHex: String {
        switch self {
        case .mint:
            return "#2F7D67"
        case .sage:
            return "#667A57"
        case .lavender:
            return "#6F63A8"
        case .lilac:
            return "#8A67A8"
        case .softBlue:
            return "#4D74A6"
        case .sky:
            return "#4F8FA8"
        case .turquoise:
            return "#2E8C8A"
        case .softPeach:
            return "#B9785F"
        case .paleApricot:
            return "#B8874F"
        case .creamYellow:
            return "#A8923A"
        case .powderPink:
            return "#A46F86"
        case .pearl:
            return "#6E7582"
        }
    }

    var brightHex: String {
        switch self {
        case .mint:
            return "#4EC6A4"
        case .sage:
            return "#9BB985"
        case .lavender:
            return "#A99BE6"
        case .lilac:
            return "#C594E8"
        case .softBlue:
            return "#82A8E3"
        case .sky:
            return "#83C9E3"
        case .turquoise:
            return "#52C9C5"
        case .softPeach:
            return "#E6A78E"
        case .paleApricot:
            return "#E7B978"
        case .creamYellow:
            return "#E6D46E"
        case .powderPink:
            return "#DFA5B9"
        case .pearl:
            return "#AEB7C7"
        }
    }

    var pastelHex: String {
        switch self {
        case .mint:
            return "#CFEFE5"
        case .sage:
            return "#DDE8D2"
        case .lavender:
            return "#E2DCF8"
        case .lilac:
            return "#ECD9F6"
        case .softBlue:
            return "#D9E7F9"
        case .sky:
            return "#D9F0F8"
        case .turquoise:
            return "#D3F2EF"
        case .softPeach:
            return "#F5DED4"
        case .paleApricot:
            return "#F6E5C9"
        case .creamYellow:
            return "#F4EDBE"
        case .powderPink:
            return "#F2DCE5"
        case .pearl:
            return "#E4E8EF"
        }
    }

    func hex(for variant: CooleurVariant) -> String {
        switch variant {
        case .dark:
            return darkHex
        case .bright:
            return brightHex
        case .pastel:
            return pastelHex
        }
    }
}
