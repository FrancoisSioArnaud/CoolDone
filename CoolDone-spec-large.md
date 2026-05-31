# CoolDone — Spec large produit

**Statut :** cadrage produit large  
**Plateforme cible :** iPhone only  
**Approche :** widget-first / app minimale  
**Version du document :** 0.1  
**Date :** 2026-05-31

---

## 1. Résumé du concept

**CoolDone** est une application iPhone centrée sur des **Cooldowns** : des tâches récurrentes, personnelles, simples, souvent agréables ou utiles, que l’on aime faire mais que l’on oublie parce que la vie suit son cours.

Exemples typiques :

- Appeler maman tous les 23 jours.
- Aller faire du frisbee avec le chien tous les 5 jours.
- Laver la douche tous les 12 jours.
- Aller boire un verre avec quelqu’un tous les 18 jours.
- Jouer de la guitare tous les 11 jours.

Le produit ne doit pas ressembler à une todo-list classique, ni à une app de productivité culpabilisante. Il ne doit pas mettre l’utilisateur face à une liste de choses “en retard”. Il doit simplement aider à voir, d’un coup d’œil, ce qui revient bientôt ou ce qui est prêt à être refait.

Le cœur de l’expérience est le **widget iPhone**. L’app existe surtout pour créer, modifier, supprimer et configurer les Cooldowns. L’usage quotidien doit se faire principalement depuis le widget.

---

## 2. Vision produit

### 2.1. Promesse

> CoolDone t’aide à ne pas oublier les petites choses que tu veux refaire régulièrement, sans pression, sans calendrier rigide, sans culpabilité.

### 2.2. Positionnement

CoolDone n’est pas :

- une todo-list ;
- un calendrier ;
- une app de rappel stricte ;
- une app de streak ;
- un outil de performance ;
- une app de suivi d’habitudes quotidiennes.

CoolDone est :

- un outil doux pour suivre des rythmes personnels ;
- une visualisation de tâches récurrentes sous forme de jauges qui se vident ;
- une app faite pour les tâches qu’on aime faire, qu’on veut faire, ou qu’on devrait refaire de temps en temps, mais qu’on oublie facilement ;
- un produit simple, calme, joli, non violent.

### 2.3. Philosophie

Le produit doit respecter ces principes :

1. **Pas de culpabilité**  
   Aucun wording ne doit suggérer un échec, un retard ou une faute.

2. **Pas de pression**  
   Un Cooldown vide signifie seulement qu’il est prêt. Il n’est jamais “en retard”.

3. **Pas de cadence calendaire rigide**  
   Les durées ne doivent pas être des récurrences classiques du type chaque semaine, toutes les deux semaines ou chaque mois.

4. **Widget d’abord**  
   Le widget est le lieu de consultation principal. L’app est un outil de configuration.

5. **Simple avant tout**  
   Le MVP doit éviter les stats, les comptes, les streaks, les catégories complexes et les historiques détaillés.

6. **Fun discret**  
   Le lexique peut être playful, mais l’interface doit rester lisible et calme.

---

## 3. Lexique produit

### 3.1. Nom du produit

**CoolDone**

Le nom est un assemblage de **Cool** et **Done**.

Dans ce contexte, **Cool** ne veut pas dire “froid”. Il veut dire : détendu, tranquille, chill, agréable. Il ne faut donc pas utiliser de champ lexical lié au chaud, au froid ou au refroidissement.

### 3.2. Entités principales

| Terme | Définition |
|---|---|
| **Cooldown** | Une tâche récurrente définie par l’utilisateur. |
| **Cooleur** | La couleur associée à un Cooldown. |
| **C’est fait** | Action principale pour indiquer que le Cooldown vient d’être réalisé. |
| **CoolDone** | Feedback positif après l’action “C’est fait”. |
| **Prêt** | État d’un Cooldown vide, donc disponible à refaire. |

### 3.3. États recommandés

Les Cooldowns ne doivent pas être décrits comme “chauds”, “froids”, “refroidis” ou “en retard”.

États recommandés :

| État | Sens | Usage UI |
|---|---|---|
| **Tranquille** | Le Cooldown vient d’être fait récemment. | Jauge très remplie. |
| **Ça revient** | Le Cooldown avance dans son cycle. | Jauge intermédiaire. |
| **Presque prêt** | Le Cooldown est proche d’être vide. | Jauge basse. |
| **Prêt** | Le Cooldown est vide. | Mis en avant doucement. |

### 3.4. Wording interdit ou déconseillé

À éviter dans tout le produit :

- “en retard” ;
- “retard” ;
- “deadline” ;
- “échec” ;
- “raté” ;
- “à faire absolument” ;
- “urgent” ;
- “dépêche-toi” ;
- “tu dois” ;
- “streak perdu” ;
- “refroidit” ;
- “froid” ;
- “chaud” ;
- “brûlant”.

---

## 4. Utilisateur cible

### 4.1. Besoin principal

L’utilisateur veut garder en tête des choses qui reviennent régulièrement, mais sans les transformer en obligations pesantes.

Il peut s’agir de :

- tâches domestiques ;
- relations sociales ;
- loisirs ;
- petits soins personnels ;
- entretien léger ;
- moments avec des proches ;
- habitudes non quotidiennes.

### 4.2. Exemples de cas d’usage

#### Cas 1 — Relationnel

L’utilisateur veut appeler sa mère environ toutes les 3 semaines. Il crée un Cooldown “Appeler maman” avec une durée de 23 jours. Quand il appelle sa mère, il appuie sur **C’est fait**. Le Cooldown redevient plein, puis se vide progressivement au fil des jours.

#### Cas 2 — Loisir

L’utilisateur aime jouer de la guitare, mais oublie facilement de le faire. Il crée “Jouer de la guitare” avec une durée de 11 jours. Quand le Cooldown est prêt, il remonte dans le widget.

#### Cas 3 — Entretien

L’utilisateur veut laver sa douche de temps en temps sans créer une alerte agressive. Il crée “Laver la douche” avec une durée de 12 jours. Quand le Cooldown est vide, il est simplement marqué **Prêt**.

### 4.3. Ce que le produit doit éviter

L’utilisateur ne doit jamais avoir l’impression :

- d’être en retard ;
- d’avoir échoué ;
- d’être surveillé ;
- d’avoir une liste de corvées ;
- d’être enfermé dans un calendrier.

---

## 5. Concept central : le Cooldown

### 5.1. Définition

Un **Cooldown** est une tâche récurrente définie par l’utilisateur.

Tous les Cooldowns sont récurrents par nature. Il n’existe pas de Cooldown ponctuel dans le produit.

Un Cooldown possède au minimum :

- un nom ;
- une durée de récurrence ;
- une Cooleur ;
- une date de dernière validation, appelée ici `lastDoneAt`.

### 5.2. Cycle de vie

1. L’utilisateur crée un Cooldown.
2. Le Cooldown apparaît dans l’app et dans le widget.
3. Quand l’utilisateur fait la tâche, il appuie sur **C’est fait**.
4. Le Cooldown devient plein.
5. Le Cooldown se vide progressivement au fil du temps.
6. Quand le Cooldown est vide, il devient **Prêt**.
7. Il reste **Prêt** jusqu’à ce que l’utilisateur appuie de nouveau sur **C’est fait**.
8. Le cycle recommence.

### 5.3. Règle importante : pas de retard

Un Cooldown vide n’est pas un Cooldown dépassé.

Il n’y a aucune notion de :

- retard ;
- dépassement ;
- échéance manquée ;
- pénalité ;
- compteur “prêt depuis X jours”.

Si un Cooldown est vide depuis 1 jour, 3 semaines ou 6 mois, l’interface affiche simplement qu’il est **Prêt**.

### 5.4. Règle de remplissage

Après l’action **C’est fait**, le Cooldown est visuellement plein.

Ensuite, il se vide progressivement.

La valeur visuelle correspond au temps restant dans le cycle :

- 100 % : l’utilisateur vient de faire la tâche ;
- 50 % : environ la moitié du cycle est passée ;
- 0 % : le Cooldown est prêt.

En UI, il est recommandé de ne pas afficher explicitement le pourcentage. Le pourcentage est une donnée technique interne, pas un élément de langage utilisateur.

---

## 6. Durées de récurrence

### 6.1. Principe

La durée de récurrence est définie par l’utilisateur, mais elle doit être proposée sous forme de durées générées ou présélectionnées par CoolDone.

Le MVP ne propose pas un champ libre permettant d’entrer “tous les 7 jours”, “tous les mois” ou “tous les lundis”.

### 6.2. Ce que signifie “durée non ronde”

Ici, “non ronde” ne veut pas dire “sans nombre entier”. Les exemples comme 5 jours, 11 jours, 12 jours, 18 jours ou 23 jours sont valides.

“Non ronde” veut dire : pas une cadence calendaire évidente ou socialement rigide.

Durées à éviter :

- tous les jours ;
- toutes les semaines ;
- toutes les 2 semaines ;
- tous les mois ;
- tous les trimestres ;
- tous les ans ;
- tous les lundis ;
- le 1er du mois.

Durées acceptables :

- 5 jours ;
- 8 jours ;
- 11 jours ;
- 12 jours ;
- 18 jours ;
- 23 jours ;
- 37 jours ;
- 53 jours ;
- 76 jours.

### 6.3. UX de sélection de durée en V0

L’utilisateur ne saisit pas directement une durée libre.

Il choisit parmi des suggestions générées par CoolDone.

Exemple d’interface :

```text
À quel rythme ?

[ 5 jours ] [ 8 jours ] [ 11 jours ]
[ 12 jours ] [ 18 jours ] [ 23 jours ]

Autres rythmes
[ 37 jours ] [ 53 jours ] [ 76 jours ]

[ Regénérer des rythmes ]
```

### 6.4. Génération des durées

Le générateur doit proposer des durées qui semblent naturelles sans être des cadences calendaires classiques.

Catégories possibles :

| Catégorie | Exemples de durées |
|---|---|
| Très souvent | 2j, 3j, 5j |
| Souvent | 8j, 11j, 12j |
| De temps en temps | 18j, 23j, 27j |
| Rarement | 37j, 45j, 53j |
| Très rarement | 76j, 89j, 144j |

La V0 peut utiliser une liste fixe de durées validées produit. La génération dynamique peut venir en V1.

### 6.5. Durée minimale et maximale recommandées

Pour le MVP :

- durée minimale : 2 jours ;
- durée maximale : 180 jours.

Raison : CoolDone n’est pas une app de tâches horaires ou quotidiennes strictes. Le produit est plus pertinent pour des rythmes espacés.

---

## 7. Tri et priorisation

### 7.1. Règle globale

Les Cooldowns sont toujours triés du plus vide au plus rempli.

Cette règle vaut :

- dans le widget ;
- dans la liste principale de l’app ;
- dans les écrans de sélection ;
- dans toute future vue récapitulative.

### 7.2. Ordre exact

Priorité d’affichage :

1. Cooldowns **Prêts** : jauge vide.
2. Cooldowns **Presque prêts** : jauge très basse.
3. Cooldowns en cours de cycle.
4. Cooldowns récemment faits : jauge très remplie.

### 7.3. Égalités

Si plusieurs Cooldowns ont le même niveau visuel ou sont tous prêts, l’ordre recommandé est :

1. ordre manuel utilisateur si disponible ;
2. sinon date de création la plus ancienne en premier ;
3. sinon ordre alphabétique.

Pour la V0, il est acceptable de ne pas proposer d’ordre manuel.

---

## 8. Visualisation

### 8.1. V0 : barre horizontale

Pour le MVP, la représentation visuelle d’un Cooldown est une barre horizontale.

Comportement :

- barre pleine après **C’est fait** ;
- barre qui se vide avec le temps ;
- barre vide quand le Cooldown est **Prêt** ;
- couleur de la barre = Cooleur du Cooldown.

### 8.2. Affichage recommandé dans une carte

Chaque Cooldown peut être affiché sous forme de carte simple :

```text
Appeler maman                         Prêt
[____________________________]
```

Ou, quand il vient d’être fait :

```text
Jouer de la guitare                 Tranquille
[████████████████████████████]
```

### 8.3. Pas de temps restant en V0

L’interface V0 n’affiche pas le temps restant précis.

Pas de :

- “2j 4h restants” ;
- “dans 8 heures” ;
- “prêt depuis 3 jours”.

L’interface affiche seulement un état :

- Tranquille ;
- Ça revient ;
- Presque prêt ;
- Prêt.

### 8.4. Mise en avant des Cooldowns prêts

Quand un Cooldown est vide, il doit être mis en avant sans agressivité.

Mise en avant recommandée :

- remontée automatique en haut de liste ;
- label **Prêt** ;
- contour doux avec la Cooleur ;
- fond légèrement plus visible ;
- éventuellement une petite brillance ou un halo très discret.

À éviter :

- rouge ;
- vibration permanente ;
- animation agressive ;
- clignotement ;
- message d’urgence ;
- badge d’erreur.

### 8.5. V1 : mode graphique

La V1 pourra explorer une représentation plus distinctive :

- capsules qui se vident ;
- formes organiques ;
- cartes plus illustrées ;
- mini jauges circulaires ;
- visualisation plus expressive des Cooleurs.

La V0 doit rester simple : barre horizontale, lisible, fiable.

---

## 9. Cooleurs

### 9.1. Définition

Une **Cooleur** est la couleur associée à un Cooldown.

Chaque Cooldown a exactement une Cooleur.

### 9.2. Palette V0

Le MVP propose 12 Cooleurs prédéfinies.

Contraintes :

- pas de rouge ;
- pas d’orange agressif ;
- pas de couleur d’alerte ;
- couleurs lisibles sur widget ;
- couleurs douces mais pas fades ;
- contraste suffisant avec le texte et le fond.

Palette indicative :

| Nom interne | Intention |
|---|---|
| Menthe | Frais visuellement, mais sans lexique froid. |
| Sauge | Calme, naturel. |
| Lavande | Doux, personnel. |
| Lilas | Playful léger. |
| Bleu doux | Clair, fiable. |
| Ciel | Léger. |
| Turquoise | Énergique sans agressivité. |
| Pêche douce | Chaleureux sans alerte. |
| Abricot pâle | Positif. |
| Jaune crème | Lumineux. |
| Rose poudré | Doux, non rouge. |
| Perle | Neutre coloré. |

### 9.3. Sélection

À la création d’un Cooldown :

- une Cooleur est attribuée automatiquement ;
- l’utilisateur peut la modifier ;
- le nom “Cooleur” doit apparaître dans l’UI.

Exemple :

```text
Choisis une Cooleur
```

ou

```text
Cooleur
[palette]
```

### 9.4. Pas de color picker libre en V0

Le MVP ne propose pas de color picker libre.

Raison :

- garder une direction artistique cohérente ;
- éviter les couleurs agressives ;
- simplifier l’interface ;
- garantir la lisibilité dans les widgets.

---

## 10. Widget-first

### 10.1. Principe

CoolDone est une app **widget-first**.

L’app est nécessaire pour :

- créer un Cooldown ;
- modifier un Cooldown ;
- supprimer un Cooldown ;
- configurer les notifications ;
- gérer les autorisations ;
- éventuellement valider un Cooldown si l’action directe depuis le widget n’est pas retenue ou pas disponible dans un contexte donné.

Mais l’usage quotidien attendu est :

1. l’utilisateur regarde son widget ;
2. il voit les Cooldowns les plus vides ;
3. il sait ce qui est prêt ;
4. il appuie sur **C’est fait** quand il a réalisé une tâche.

### 10.2. Formats de widgets

Priorité souhaitée :

1. **Grand widget** ;
2. **Widget moyen** ;
3. **Petit widget**.

### 10.3. Grand widget — priorité V0

Le grand widget est le format principal du MVP.

Objectif : afficher plusieurs Cooldowns avec assez de confort visuel.

Contenu recommandé :

- 5 à 8 Cooldowns selon densité ;
- triés du plus vide au plus rempli ;
- nom ;
- état ;
- barre horizontale ;
- Cooleur visible ;
- action **C’est fait** si interaction directe disponible.

### 10.4. Widget moyen — priorité V0

Le widget moyen est également dans le périmètre V0.

Objectif : afficher les Cooldowns les plus importants ou les plus prêts.

Contenu recommandé :

- 2 à 4 Cooldowns ;
- mêmes règles de tri ;
- affichage plus compact ;
- état visible.

### 10.5. Petit widget — priorité secondaire

Le petit widget peut être livré après le grand et le moyen si le temps le permet.

Deux options possibles :

- afficher le Cooldown le plus prêt ;
- afficher un résumé global : nombre de Cooldowns prêts + premier Cooldown prêt.

Recommandation : afficher le Cooldown le plus prêt.

### 10.6. Interaction depuis le widget

Comportement cible :

- l’utilisateur peut marquer un Cooldown comme fait depuis le widget ;
- l’action déclenche la mise à jour du Cooldown ;
- le widget se rafraîchit ;
- feedback court : **CoolDone**.

Fallback acceptable :

- si l’interaction directe est techniquement limitée, le tap ouvre l’app sur une page ultra simple du Cooldown ;
- cette page affiche un bouton principal **C’est fait** ;
- après validation, retour possible au widget ou fermeture naturelle de l’app.

### 10.7. Widget configurable

À terme, l’utilisateur pourrait choisir quels Cooldowns afficher dans un widget donné.

Pour la V0, la règle automatique suffit : afficher les Cooldowns les plus vides.

---

## 11. App minimale

### 11.1. Rôle de l’app

L’app ne doit pas devenir un dashboard complexe.

Elle sert à :

- créer ;
- modifier ;
- supprimer ;
- consulter la liste complète ;
- gérer les notifications ;
- présenter le concept au premier lancement.

### 11.2. Écrans V0

#### 1. Onboarding court

Objectif : expliquer le concept en une ou deux étapes maximum.

Exemple :

```text
Des petits rythmes, sans pression.

Crée des Cooldowns pour les choses que tu veux refaire de temps en temps.
Ils se vident doucement. Quand c’est prêt, tu le vois dans ton widget.
```

Actions :

- créer un premier Cooldown ;
- demander l’autorisation de notification au bon moment, pas forcément au premier écran ;
- guider vers l’ajout du widget si nécessaire.

#### 2. Liste des Cooldowns

Liste simple, triée du plus vide au plus rempli.

Chaque item affiche :

- nom ;
- état ;
- Cooleur ;
- barre ;
- bouton ou action **C’est fait**.

#### 3. Création d’un Cooldown

Champs :

- nom ;
- durée générée ;
- Cooleur ;
- notification activée ou non.

Option recommandée :

- “Je viens de le faire” : si activé, le Cooldown démarre plein ;
- sinon, le Cooldown démarre **Prêt**.

#### 4. Modification d’un Cooldown

Permet de modifier :

- nom ;
- durée ;
- Cooleur ;
- notification ;
- éventuellement “C’est fait”.

#### 5. Suppression

La V0 permet de supprimer un Cooldown.

La suppression doit être confirmée avec un message simple :

```text
Supprimer ce Cooldown ?
```

Boutons :

- Annuler ;
- Supprimer.

Pas d’archive en V0.

### 11.3. Écrans exclus de la V0

Pas de :

- statistiques ;
- calendrier ;
- compte utilisateur ;
- écran social ;
- historique détaillé ;
- badges ;
- streaks ;
- catégories complexes ;
- marketplace de templates ;
- thème custom avancé.

---

## 12. Création d’un Cooldown

### 12.1. Flow recommandé

Le flow de création doit être très court.

Étapes :

1. Nom du Cooldown.
2. Choix d’une durée proposée.
3. Choix ou validation de la Cooleur automatique.
4. Option notification.
5. Création.

### 12.2. Exemple de formulaire

```text
Nouveau Cooldown

Nom
[ Appeler maman ]

Rythme
[ 5j ] [ 11j ] [ 12j ]
[ 18j ] [ 23j ] [ 37j ]

Cooleur
[ Pastilles de couleur ]

Notification
[ ] Me prévenir quand c’est prêt

[ Créer le Cooldown ]
```

### 12.3. Validation

Règles :

- le nom est obligatoire ;
- la durée est obligatoire ;
- la Cooleur est obligatoire mais peut être auto-attribuée ;
- la notification est optionnelle ;
- tous les Cooldowns sont récurrents.

### 12.4. Nom

Le nom doit rester libre.

Limites recommandées :

- minimum : 1 caractère ;
- maximum : 60 caractères ;
- affichage widget : tronquer proprement si nécessaire.

### 12.5. Durée

La durée est choisie parmi les propositions générées.

En V0, les durées sont exprimées en jours.

Pas d’heures/minutes en V0.

### 12.6. État initial

Deux comportements possibles :

1. **Par défaut : Prêt**  
   Si l’utilisateur crée une tâche sans dire qu’il vient de la faire, elle apparaît comme prête.

2. **Option : Je viens de le faire**  
   Le Cooldown démarre plein au moment de la création.

Recommandation V0 : proposer cette option, désactivée par défaut.

---

## 13. Action “C’est fait”

### 13.1. Définition

L’action **C’est fait** indique que l’utilisateur vient de réaliser le Cooldown.

Effets :

- `lastDoneAt` devient maintenant ;
- la jauge redevient pleine ;
- l’état devient **Tranquille** ;
- la notification suivante est reprogrammée si elle est activée ;
- le widget est rafraîchi.

### 13.2. Feedback

Feedback recommandé :

```text
CoolDone
```

ou

```text
CoolDone.
```

Le feedback doit être court.

Pas besoin de confettis lourds, de points, de score ou de streak.

### 13.3. Undo

La V0 peut se passer d’un undo.

Si un undo est ajouté, il doit être très discret :

```text
CoolDone. Annuler
```

Mais cela ajoute de la complexité de données. Recommandation : hors V0.

---

## 14. Notifications

### 14.1. Périmètre V0

Le MVP inclut les notifications locales quand un Cooldown devient prêt.

Les notifications sont optionnelles par Cooldown.

### 14.2. Règles

- L’utilisateur choisit d’activer ou non une notification pour chaque Cooldown.
- Si la notification est activée, elle est programmée pour le moment où le Cooldown atteint 0 %.
- Si l’utilisateur appuie sur **C’est fait**, la notification suivante est recalculée.
- Si le Cooldown est déjà prêt, aucune notification répétée ne doit être envoyée.
- Pas de relance automatique quotidienne.

### 14.3. Wording

Titre recommandé :

```text
Ton Cooldown est prêt
```

Body possible :

```text
Appeler maman est prêt.
```

ou

```text
C’est peut-être le bon moment pour Appeler maman.
```

À éviter :

```text
Tu es en retard.
```

```text
N’oublie pas de faire ta tâche.
```

```text
Urgent.
```

### 14.4. Autorisation

Ne pas demander l’autorisation de notification au premier lancement sans contexte.

Moment recommandé : lors de la création du premier Cooldown avec notification activée.

---

## 15. Données

### 15.1. Modèle Cooldown

Modèle conceptuel :

```ts
type Cooldown = {
  id: string
  name: string
  durationDays: number
  cooleurId: string
  notificationEnabled: boolean
  lastDoneAt: string | null
  createdAt: string
  updatedAt: string
  deletedAt?: string | null
}
```

### 15.2. Données calculées

Ces valeurs ne doivent pas forcément être stockées. Elles peuvent être recalculées.

```ts
type CooldownComputedState = {
  elapsedRatio: number
  remainingRatio: number
  isReady: boolean
  status: 'tranquille' | 'ca_revient' | 'presque_pret' | 'pret'
}
```

### 15.3. Calcul recommandé

```text
elapsed = now - lastDoneAt
cycle = durationDays en secondes
remainingRatio = max(0, 1 - elapsed / cycle)
isReady = remainingRatio === 0
```

Si `lastDoneAt` est `null`, le Cooldown est considéré comme **Prêt**.

### 15.4. Seuils d’état recommandés

| remainingRatio | État |
|---:|---|
| 0 | Prêt |
| > 0 et <= 0.25 | Presque prêt |
| > 0.25 et <= 0.66 | Ça revient |
| > 0.66 | Tranquille |

Ces seuils sont des valeurs produit par défaut. Ils peuvent être ajustés après test.

### 15.5. Stockage V0

La V0 est locale uniquement.

Pas de :

- compte ;
- backend ;
- login ;
- synchronisation ;
- partage.

Les données doivent être accessibles à l’app et au widget.

### 15.6. Suppression

La V0 peut supprimer définitivement un Cooldown.

Techniquement, un `deletedAt` peut être utile pour éviter les effets de bord avec les widgets, mais côté produit il n’y a pas d’archive.

---

## 16. Architecture produit par versions

## 16.1. V0 — MVP

### Objectif

Prouver que le concept widget-first est utile, simple et agréable.

### Plateforme

- iPhone only.
- iOS moderne.
- App native SwiftUI recommandée.
- WidgetKit pour les widgets.
- Données locales.

### Fonctionnalités incluses

#### Cooldowns

- Créer un Cooldown.
- Modifier un Cooldown.
- Supprimer un Cooldown.
- Marquer comme fait avec **C’est fait**.
- Tous les Cooldowns sont récurrents.
- Durées choisies parmi des propositions générées.
- Pas de durées calendaires rondes.

#### Visualisation

- Barre horizontale.
- Jauge pleine après **C’est fait**.
- Jauge qui se vide au fil du temps.
- Jauge vide = **Prêt**.
- Pas de temps restant précis.
- Pas de retard.
- Tri du plus vide au plus rempli.

#### Cooleurs

- 12 Cooleurs prédéfinies.
- Cooleur obligatoire mais auto-attribuée par défaut.
- Pas de rouge.
- Pas de color picker libre.

#### Widgets

- Grand widget.
- Widget moyen.
- Petit widget si temps disponible après les deux premiers.
- Affichage automatique des Cooldowns les plus vides.
- Action **C’est fait** directement depuis le widget si possible.
- Fallback vers l’app si nécessaire.

#### Notifications

- Notification optionnelle par Cooldown.
- Notification envoyée quand le Cooldown devient prêt.
- Pas de relance répétée.
- Wording doux : **Ton Cooldown est prêt**.

#### App

- Onboarding court.
- Liste des Cooldowns.
- Création.
- Modification.
- Suppression.
- Gestion basique des notifications.

### Exclusions V0

- Pas de compte.
- Pas de backend.
- Pas d’iCloud.
- Pas de stats.
- Pas d’historique complet.
- Pas de streak.
- Pas de catégories.
- Pas d’archive.
- Pas de pause.
- Pas de partage.
- Pas de collaboration.
- Pas de calendrier.
- Pas de rappels répétés.
- Pas de color picker libre.
- Pas de mode graphique avancé.

---

## 16.2. V0.1 — Stabilisation et polish

### Objectif

Améliorer la qualité d’usage après les premiers tests.

### Fonctionnalités possibles

- Petit widget si non livré en V0.
- Meilleur onboarding pour aider à ajouter le widget.
- Ajustement des statuts.
- Ajustement des seuils visuels.
- Meilleure sélection des durées.
- Suggestions de Cooldowns au premier lancement.
- Micro-animations discrètes.
- Accessibilité renforcée.
- Amélioration de la lisibilité des Cooleurs.

---

## 16.3. V1 — Expérience plus expressive

### Objectif

Donner à CoolDone une identité visuelle plus forte sans complexifier le produit.

### Fonctionnalités possibles

#### Mode graphique

- Remplacer ou compléter la barre horizontale par une visualisation plus distinctive.
- Capsules, formes, cartes visuelles ou mini jauges.
- Meilleure mise en avant des Cooldowns prêts.

#### Pause

La V1 introduit la pause.

Une pause signifie :

- le Cooldown est temporairement exclu de la liste active ;
- il ne déclenche pas de notification ;
- il ne progresse pas ou reste figé selon la décision produit à prendre ;
- il peut être repris plus tard.

Pas d’archive. La pause remplace le besoin d’archive.

#### Durées plus intelligentes

- Génération dynamique de rythmes.
- Regénération plus fine.
- Suggestions selon le type de Cooldown.
- Durées favorites.

#### Widgets configurables

- Choisir les Cooldowns affichés dans un widget précis.
- Créer plusieurs widgets avec des sélections différentes.
- Exemple : widget “maison”, widget “relations”, widget “loisirs”.

#### Personnalisation légère

- Emoji optionnel par Cooldown.
- Variantes de Cooleurs.
- Ordre manuel si besoin.

---

## 16.4. V2 — Synchronisation et continuité

### Objectif

Permettre à l’utilisateur de retrouver ses Cooldowns sur plusieurs appareils Apple.

### Fonctionnalités possibles

- Synchronisation iCloud.
- Restauration après changement d’iPhone.
- Gestion plus robuste des données.
- Historique léger si utile.
- Export/import.

### Hors intention V2 sauf décision contraire

Même avec iCloud, CoolDone ne doit pas devenir :

- un réseau social ;
- une app de productivité lourde ;
- un outil de reporting ;
- un système de performance personnelle.

---

## 17. Wording UI recommandé

### 17.1. Onboarding

```text
Des petits rythmes, sans pression.
```

```text
Crée des Cooldowns pour les choses que tu veux refaire de temps en temps.
Ils se vident doucement. Quand c’est prêt, tu le vois dans ton widget.
```

```text
Pas de retard. Pas de score. Juste un coup d’œil.
```

### 17.2. Création

```text
Nouveau Cooldown
```

```text
Nom
```

```text
Rythme
```

```text
Choisis une Cooleur
```

```text
Me prévenir quand c’est prêt
```

```text
Je viens de le faire
```

```text
Créer le Cooldown
```

### 17.3. Action

```text
C’est fait
```

Feedback :

```text
CoolDone
```

### 17.4. États

```text
Tranquille
```

```text
Ça revient
```

```text
Presque prêt
```

```text
Prêt
```

### 17.5. Suppression

```text
Supprimer ce Cooldown ?
```

```text
Il disparaîtra de l’app et du widget.
```

Boutons :

```text
Annuler
```

```text
Supprimer
```

### 17.6. Notifications

Titre :

```text
Ton Cooldown est prêt
```

Body :

```text
Appeler maman est prêt.
```

Alternative plus douce :

```text
C’est peut-être le bon moment pour Appeler maman.
```

---

## 18. Design principles

### 18.1. Ton visuel

Le produit doit être :

- doux ;
- clair ;
- moderne ;
- simple ;
- légèrement playful ;
- jamais alarmiste.

### 18.2. Couleurs

Règles :

- pas de rouge ;
- pas d’état d’erreur pour un Cooldown prêt ;
- pas de couleur agressive ;
- les Cooleurs doivent rester jolies même en widget ;
- priorité au contraste et à la lisibilité.

### 18.3. Typographie

Recommandation :

- utiliser les standards iOS au départ ;
- ne pas surdesigner la V0 ;
- garder une hiérarchie claire entre nom, état et action.

### 18.4. Animation

Animations V0 :

- très courtes ;
- uniquement pour confirmer une action ;
- jamais répétées de manière agressive.

Exemple :

- légère transition de la jauge vers plein après **C’est fait** ;
- apparition courte du feedback **CoolDone**.

---

## 19. Règles métier détaillées

### 19.1. Tous les Cooldowns sont récurrents

Il n’existe pas de Cooldown ponctuel.

### 19.2. Un Cooldown a toujours une durée

La durée est obligatoire.

### 19.3. Un Cooldown a toujours une Cooleur

La Cooleur est obligatoire, mais elle peut être choisie automatiquement.

### 19.4. Un Cooldown prêt reste prêt

Quand un Cooldown atteint 0 %, il reste à 0 % jusqu’à la prochaine validation.

### 19.5. Aucun retard

Le système ne stocke pas et n’affiche pas de notion de retard.

### 19.6. Pas de date de prochaine occurrence affichée en V0

Le système peut calculer la prochaine date de notification, mais l’UI ne doit pas afficher “prochaine fois le…” en V0.

### 19.7. Tri automatique

Le tri par niveau de jauge est global et permanent.

### 19.8. Notification unique

Une notification est envoyée quand le Cooldown devient prêt, pas ensuite de manière répétée.

### 19.9. Suppression

La suppression retire le Cooldown des vues actives et du widget.

### 19.10. Pas de score

Aucune action ne donne de points, badges, séries ou récompenses numériques en V0.

---

## 20. Scénarios utilisateur clés

### 20.1. Créer un Cooldown social

1. L’utilisateur ouvre l’app.
2. Il appuie sur créer.
3. Il saisit “Appeler maman”.
4. Il choisit “23 jours”.
5. Il garde la Cooleur proposée.
6. Il active la notification.
7. Il crée le Cooldown.
8. Le Cooldown apparaît dans la liste et dans le widget.

### 20.2. Marquer comme fait

1. L’utilisateur a appelé sa mère.
2. Il regarde le widget.
3. Il appuie sur **C’est fait** pour “Appeler maman”.
4. Le Cooldown devient plein.
5. Feedback : **CoolDone**.
6. Il redescend dans la liste car il est maintenant moins prioritaire.

### 20.3. Cooldown prêt

1. Le temps passe.
2. La jauge se vide.
3. Quand elle atteint 0 %, le Cooldown devient **Prêt**.
4. Il remonte en haut de liste.
5. Si notification activée, l’utilisateur reçoit : **Ton Cooldown est prêt**.
6. Il n’y a aucune mention de retard.

### 20.4. Supprimer un Cooldown

1. L’utilisateur ouvre l’app.
2. Il sélectionne un Cooldown.
3. Il appuie sur supprimer.
4. Confirmation.
5. Le Cooldown disparaît.

---

## 21. Critères d’acceptation V0

### 21.1. Produit

La V0 est acceptable si :

- l’utilisateur peut créer un Cooldown en moins de 30 secondes ;
- il peut voir ses Cooldowns dans un widget ;
- les Cooldowns se vident correctement avec le temps ;
- un Cooldown vide est affiché comme **Prêt** ;
- aucun écran n’utilise la notion de retard ;
- les Cooldowns sont triés du plus vide au plus rempli ;
- les notifications optionnelles fonctionnent ;
- le produit reste local-only.

### 21.2. UX

La V0 est acceptable si :

- l’app paraît simple ;
- le widget est lisible ;
- les couleurs ne donnent pas une impression d’alerte ;
- l’action **C’est fait** est évidente ;
- le feedback **CoolDone** est compréhensible ;
- les durées proposées sont faciles à choisir.

### 21.3. Technique

La V0 est acceptable si :

- l’app et le widget lisent les mêmes données ;
- le widget se met à jour après une action ;
- les notifications sont reprogrammées après **C’est fait** ;
- la suppression retire bien le Cooldown du widget ;
- l’app fonctionne hors ligne ;
- aucune donnée personnelle n’est envoyée à un serveur.

---

## 22. Questions ouvertes restantes

Ces points restent à trancher ou à tester.

### Q1 — Interaction directe dans le widget

Cible : action directe **C’est fait** depuis le widget.

À valider techniquement selon la cible iOS exacte et les contraintes WidgetKit.

Fallback : ouvrir l’app sur une vue de validation.

### Q2 — Nombre exact d’items dans les widgets

À tester sur device :

- grand widget : 5, 6, 7 ou 8 Cooldowns ;
- widget moyen : 2, 3 ou 4 Cooldowns.

La lisibilité doit primer sur la densité.

### Q3 — État initial par défaut

Recommandation : un nouveau Cooldown démarre **Prêt** sauf si l’utilisateur active “Je viens de le faire”.

À tester : cela peut surprendre certains utilisateurs.

### Q4 — Seuils d’état

Seuils recommandés :

- Tranquille : > 66 % ;
- Ça revient : 25–66 % ;
- Presque prêt : 1–25 % ;
- Prêt : 0 %.

À ajuster après usage réel.

### Q5 — Nom final des états

Les noms recommandés sont :

- Tranquille ;
- Ça revient ;
- Presque prêt ;
- Prêt.

À valider avec tests de compréhension.

---

## 23. Décisions actées

- Le produit s’appelle **CoolDone**.
- Le concept central est le **Cooldown**.
- Une couleur de Cooldown s’appelle une **Cooleur**.
- Les Cooldowns sont des tâches récurrentes.
- Tous les Cooldowns sont récurrents.
- Un Cooldown a un nom, une Cooleur et une durée.
- La durée est définie par l’utilisateur via des propositions générées.
- Les durées ne doivent pas être des cadences calendaires rondes.
- Le Cooldown est plein après **C’est fait**.
- Le Cooldown se vide au fil du temps.
- Un Cooldown vide est **Prêt**.
- Il n’y a aucune notion de retard.
- On n’affiche jamais depuis combien de temps un Cooldown est prêt.
- Les Cooldowns sont triés du plus vide au plus rempli.
- Le MVP est iPhone only.
- Le MVP est widget-first.
- L’app est surtout un outil de configuration.
- La V0 utilise une barre horizontale.
- La V1 pourra avoir un mode graphique plus distinctif.
- Le MVP propose 12 Cooleurs.
- Pas de rouge.
- Les notifications sont incluses en V0, optionnelles par Cooldown.
- Le message de notification principal est : **Ton Cooldown est prêt**.
- V0 : local-only.
- V1 : pause.
- V0 : suppression.
- Pas d’archive.
- V2 : iCloud sync.

---

## 24. Synthèse V0 en une phrase

**CoolDone V0 est une app iPhone locale, widget-first, qui permet de créer des Cooldowns récurrents avec une durée non calendaire et une Cooleur, de les voir se vider dans un widget, et de les remettre à plein avec “C’est fait”, sans retard, sans score, sans pression.**
