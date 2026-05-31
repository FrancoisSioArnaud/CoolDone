# CoolDone

CoolDone est une app iOS native **iPhone only** pour suivre des Cooldowns récurrents locaux, avec une expérience **widget-first** et une action « C’est fait » disponible depuis le widget.

## V0 en bref

- Créer, modifier et supprimer des Cooldowns récurrents.
- Choisir une durée uniquement dans la liste prédéfinie.
- Associer une Cooleur prédéfinie.
- Visualiser une barre qui se vide progressivement, sans temps restant ni statut textuel.
- Marquer un Cooldown comme fait depuis l’app ou le widget.
- Programmer des notifications locales optionnelles par Cooldown.
- Fonctionnement local only : pas de compte, pas de backend, pas d’iCloud.

## Stack technique

- Swift
- SwiftUI
- WidgetKit
- App Intents
- UserNotifications
- UserDefaults partagé via App Group

## Prérequis

- Xcode compatible avec le projet `CoolDone.xcodeproj`.
- Un iPhone réel ou un simulateur iPhone.
- Une équipe de signature Apple configurée avec l’App Group `group.com.francoissioarnaud.CoolDone` pour tester l’app + le widget sur appareil réel.

## Ouvrir le projet

```sh
open CoolDone.xcodeproj
```

Puis sélectionner le scheme `CoolDone` dans Xcode.

## Lancer sur iPhone

1. Brancher ou sélectionner un iPhone dans Xcode.
2. Vérifier la signature des targets `CoolDone` et `CoolDownWidgetExtension`.
3. Vérifier que les deux targets utilisent l’App Group `group.com.francoissioarnaud.CoolDone`.
4. Lancer l’app depuis Xcode.
5. Créer quelques Cooldowns, puis ajouter le widget CoolDone sur l’écran d’accueil.

## Notes V0

- Les données restent locales à l’app et au widget.
- Le widget lit et met à jour les Cooldowns via l’App Group.
- L’action « C’est fait » du widget utilise App Intents et ne doit pas ouvrir l’app.
