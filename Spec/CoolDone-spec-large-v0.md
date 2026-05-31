# CoolDone — Spec large V0

**Statut :** cadrage produit V0  
**Plateforme cible :** iPhone only  
**Approche :** widget-first / app minimale  
**Nom produit :** CoolDone  
**Version du document :** 0.2  
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

Le produit ne doit pas ressembler à une todo-list classique, ni à une app de productivité culpabilisante. Il ne doit pas mettre l’utilisateur face à une liste de choses en retard. Il doit simplement l’aider à visualiser les Cooldowns qui sont arrivés au bout de leur cycle ou qui s’en approchent.

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
   Un Cooldown vide signifie seulement que son cycle est terminé. Il n’est jamais en retard.

3. **Pas de cadence calendaire rigide**  
   Les durées ne doivent pas être des récurrences classiques du type chaque semaine, toutes les deux semaines ou chaque mois.

4. **Widget d’abord**  
   Le widget est le lieu de consultation principal. L’app est un outil de configuration.

5. **Simple avant tout**  
   La V0 doit éviter les stats, les comptes, les streaks, les catégories complexes et les historiques détaillés.

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

### 3.3. À ne pas créer : labels d’état

La V0 ne doit pas afficher de labels d’état textuels pour les Cooldowns.

À ne pas afficher dans l’UI :

- labels du type “tranquille”, “presque”, “urgent”, “en cours”, etc. ;
- temps restant ;
- date de prochaine occurrence ;
- nombre de jours depuis la fin du cycle ;
- wording de retard ;
- label textuel indiquant que le cycle est terminé.

L’état d’un Cooldown est communiqué uniquement par :

- son niveau de barre ;
- sa position dans le tri ;
- la variation de couleur de la barre entre les trois paliers visuels.

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

L’utilisateur aime jouer de la guitare, mais oublie facilement de le faire. Il crée “Jouer de la guitare” avec une durée de 11 jours. Quand son cycle est terminé, il remonte dans le widget grâce au tri automatique.

#### Cas 3 — Entretien

L’utilisateur veut laver sa douche de temps en temps sans créer une alerte agressive. Il crée “Laver la douche” avec une durée de 12 jours. La jauge se vide progressivement, sans compteur, sans date, sans pression.

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
- une date de dernière validation, appelée ici `lastDoneAt` ;
- un réglage de notification optionnelle.

### 5.2. Cycle de vie

1. L’utilisateur crée un Cooldown.
2. Le Cooldown démarre toujours plein.
3. Le Cooldown apparaît dans l’app et dans le widget.
4. Le Cooldown se vide progressivement au fil du temps.
5. Quand la tâche est réalisée, l’utilisateur appuie sur **C’est fait**.
6. `lastDoneAt` devient maintenant.
7. Le Cooldown redevient plein.
8. Le cycle recommence.

### 5.3. Règle importante : pas de retard

Un Cooldown vide n’est pas un Cooldown dépassé.

Il n’y a aucune notion de :

- retard ;
- dépassement ;
- échéance manquée ;
- pénalité ;
- compteur “depuis X jours”.

Si un Cooldown est vide depuis 1 jour, 3 semaines ou 6 mois, l’interface n’affiche aucune durée écoulée depuis la fin de son cycle.

### 5.4. Règle de remplissage

Après l’action **C’est fait**, le Cooldown est visuellement plein.

Ensuite, il se vide progressivement.

La valeur visuelle correspond au temps restant dans le cycle :

- 100 % : l’utilisateur vient de créer le Cooldown ou de valider **C’est fait** ;
- 50 % : environ la moitié du cycle est passée ;
- 15 % : le cycle est proche de sa fin ;
- 0 % : la barre est vide.

En UI, il est recommandé de ne jamais afficher explicitement le pourcentage. Le pourcentage est une donnée technique interne, pas un élément de langage utilisateur.

---

## 6. Durées de récurrence

### 6.1. Principe

La durée de récurrence est choisie par l’utilisateur dans une **liste fixe de durées prédéfinies**.

Il n’y a pas de générateur dynamique de durées en V0.

Le produit ne propose pas :

- champ libre ;
- saisie personnalisée ;
- choix “tous les lundis” ;
- choix “chaque semaine” ;
- choix “chaque mois” ;
- génération aléatoire ;
- bouton de régénération.

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

### 6.3. Liste V0 de durées proposées

La V0 propose une liste fixe de durées en jours.

Liste recommandée :

| Durée | Intention d’usage |
|---:|---|
| 3 jours | Très fréquent sans être quotidien. |
| 5 jours | Court, utile pour loisirs ou petites tâches. |
| 8 jours | Environ hebdo sans être “chaque semaine”. |
| 11 jours | Fréquent mais souple. |
| 12 jours | Entretien léger. |
| 18 jours | Relationnel ou habitudes espacées. |
| 23 jours | Environ 3 semaines, non calendaire. |
| 27 jours | Environ mensuel sans être “tous les mois”. |
| 37 jours | Rythme rare. |
| 45 jours | Rythme long. |
| 53 jours | Rythme très espacé. |
| 76 jours | Très rare. |

Cette liste doit être définie à un seul endroit dans le code, par exemple :

```ts
export const COOLDOWN_DURATION_OPTIONS_DAYS = [
  3,
  5,
  8,
  11,
  12,
  18,
  23,
  27,
  37,
  45,
  53,
  76,
]
```

Tous les écrans de création, modification, validation et affichage doivent s’appuyer sur cette même source.

### 6.4. UX de sélection de durée

L’utilisateur choisit une durée dans la liste.

Exemple d’interface :

```text
Rythme

[ 3 jours ] [ 5 jours ] [ 8 jours ]
[ 11 jours ] [ 12 jours ] [ 18 jours ]
[ 23 jours ] [ 27 jours ] [ 37 jours ]
[ 45 jours ] [ 53 jours ] [ 76 jours ]
```

La liste doit rester simple, lisible, sans étape de personnalisation avancée.

---

## 7. Tri et priorisation

### 7.1. Règle globale

Les Cooldowns sont toujours triés du plus vide au plus rempli.

Cette règle vaut :

- dans le widget ;
- dans la liste principale de l’app ;
- dans les écrans de sélection ;
- dans toute future vue récapitulative V0.

### 7.2. Ordre exact

Priorité d’affichage :

1. Cooldowns à 0 %.
2. Cooldowns entre 0 % et 15 %.
3. Cooldowns entre 15 % et 50 %.
4. Cooldowns au-dessus de 50 %.

### 7.3. Égalités

Si plusieurs Cooldowns ont le même niveau de progression, l’ordre recommandé est :

1. date de création la plus ancienne en premier ;
2. sinon ordre alphabétique.

La V0 ne propose pas d’ordre manuel.

---

## 8. Visualisation

### 8.1. V0 : barre horizontale

Pour la V0, la représentation visuelle d’un Cooldown est une barre horizontale.

Comportement :

- barre pleine à la création ;
- barre pleine après **C’est fait** ;
- barre qui se vide avec le temps ;
- barre vide à 0 % ;
- couleur de la barre basée sur la Cooleur et sur le palier de progression.

### 8.2. Affichage recommandé dans une carte

Chaque Cooldown peut être affiché sous forme de carte simple :

```text
Appeler maman
[██████______________________]
```

Ou, quand il vient d’être fait :

```text
Jouer de la guitare
[████████████████████████████]
```

À 0 %, l’item reste visible grâce au track, au contour ou au fond de barre, mais il ne reçoit pas de label textuel.

```text
Laver la douche
[____________________________]
```

### 8.3. Aucun temps restant

L’interface n’affiche jamais le temps restant.

Pas de :

- “2j 4h restants” ;
- “dans 8 heures” ;
- “prochaine fois le…” ;
- “depuis 3 jours” ;
- compte à rebours ;
- date de prochaine occurrence.

La progression est uniquement visuelle.

### 8.4. Aucun label d’état

L’interface n’affiche aucun label d’état sur les Cooldowns.

Pas de :

- label de cycle terminé ;
- label intermédiaire ;
- label de repos ;
- label de priorité ;
- badge d’urgence ;
- texte expliquant le niveau de progression.

La hiérarchie est donnée par :

- le tri du plus vide au plus rempli ;
- la barre ;
- la variation de couleur de la barre.

### 8.5. Mise en avant à 0 %

Quand un Cooldown arrive à 0 %, il doit être mis en avant sans agressivité.

Mise en avant autorisée :

- remontée automatique en haut de liste ;
- usage du troisième palier de Cooleur ;
- track de barre plus lisible ;
- contraste légèrement renforcé sur la carte ;
- éventuellement un halo très discret et statique.

À éviter :

- rouge ;
- vibration permanente ;
- animation agressive ;
- clignotement ;
- message d’urgence ;
- badge d’erreur ;
- label textuel.

---

## 9. Cooleurs

### 9.1. Définition

Une **Cooleur** est la couleur associée à un Cooldown.

Chaque Cooldown a exactement une Cooleur.

### 9.2. Palette V0

La V0 propose 12 Cooleurs prédéfinies.

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
| Menthe | Doux, naturel. |
| Sauge | Calme, stable. |
| Lavande | Personnel, léger. |
| Lilas | Playful discret. |
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
- l’utilisateur peut la remplacer par une autre Cooleur de la palette ;
- le nom “Cooleur” doit apparaître dans l’UI.

Exemple :

```text
Cooleur
[palette]
```

### 9.4. Pas de color picker

Le produit ne propose pas de color picker libre.

La sélection de couleur se fait uniquement dans la palette prédéfinie de 12 Cooleurs.

Raison :

- garder une direction artistique cohérente ;
- éviter les couleurs agressives ;
- simplifier l’interface ;
- garantir la lisibilité dans les widgets ;
- garantir le bon fonctionnement des trois dérivés visuels de chaque Cooleur.

---

## 10. Paliers visuels de progression

### 10.1. Principe

Un Cooldown n’a pas d’état textuel, mais il possède **trois paliers visuels** basés sur le niveau restant de sa barre.

La seule différence visuelle entre ces paliers est la couleur de la barre.

Chaque Cooleur possède donc trois dérivés :

1. dérivé sombre ;
2. dérivé lumineux ;
3. dérivé pastel.

La barre évolue du dérivé sombre vers le dérivé lumineux, puis vers le dérivé pastel à mesure que le Cooldown se vide.

### 10.2. Seuils V0

Les deux seuils produit sont :

- **50 %** ;
- **15 %**.

Règle basée sur `remainingRatio` :

| remainingRatio | Dérivé de Cooleur utilisé |
|---:|---|
| `> 0.50` | Dérivé sombre |
| `> 0.15 && <= 0.50` | Dérivé lumineux |
| `>= 0 && <= 0.15` | Dérivé pastel |

### 10.3. Source unique de vérité

Ces seuils doivent être définis à un seul endroit dans le code.

Exemple :

```ts
export const COOLDOWN_PROGRESS_THRESHOLDS = {
  highToMiddle: 0.5,
  middleToLow: 0.15,
} as const

export type CooldownColorTier = 'dark' | 'bright' | 'pastel'

export function getCooldownColorTier(remainingRatio: number): CooldownColorTier {
  if (remainingRatio > COOLDOWN_PROGRESS_THRESHOLDS.highToMiddle) {
    return 'dark'
  }

  if (remainingRatio > COOLDOWN_PROGRESS_THRESHOLDS.middleToLow) {
    return 'bright'
  }

  return 'pastel'
}
```

Tous les composants visuels doivent utiliser cette fonction ou une abstraction équivalente.

Aucun composant ne doit réimplémenter ses propres seuils.

### 10.4. Données de Cooleur

Chaque Cooleur doit fournir ses trois dérivés.

Exemple conceptuel :

```ts
export type Cooleur = {
  id: string
  name: string
  dark: string
  bright: string
  pastel: string
}
```

La V0 ne doit pas calculer ces variantes au hasard au runtime. Les trois dérivés doivent être définis dans la palette produit afin de garder un rendu stable et contrôlé.

---

## 11. Widget-first

### 11.1. Principe

CoolDone est une app **widget-first**.

L’app est nécessaire pour :

- créer un Cooldown ;
- modifier un Cooldown ;
- supprimer un Cooldown ;
- configurer les notifications ;
- gérer les autorisations ;
- éventuellement valider un Cooldown si l’action directe depuis le widget n’est pas disponible dans un contexte donné.

Mais l’usage quotidien attendu est :

1. l’utilisateur regarde son widget ;
2. il voit les Cooldowns les plus vides ;
3. il comprend visuellement ceux qui sont au bout ou proches du bout ;
4. il appuie sur **C’est fait** quand il a réalisé une tâche.

### 11.2. Formats de widgets

Priorité souhaitée :

1. **Grand widget** ;
2. **Widget moyen** ;
3. **Petit widget**.

### 11.3. Grand widget — priorité V0

Le grand widget est le format principal de la V0.

Objectif : afficher plusieurs Cooldowns avec assez de confort visuel.

Contenu recommandé :

- 5 à 8 Cooldowns selon densité ;
- triés du plus vide au plus rempli ;
- nom ;
- barre horizontale ;
- Cooleur visible via la barre ;
- action **C’est fait** si interaction directe disponible.

Pas de label d’état et pas de temps restant.

### 11.4. Widget moyen — priorité V0

Le widget moyen est également dans le périmètre V0.

Objectif : afficher les Cooldowns les plus importants ou les plus avancés dans leur cycle.

Contenu recommandé :

- 2 à 4 Cooldowns ;
- mêmes règles de tri ;
- affichage plus compact ;
- barre horizontale visible.

Pas de label d’état et pas de temps restant.

### 11.5. Petit widget — après grand et moyen

Le petit widget peut être livré après le grand et le moyen si le temps le permet.

Option recommandée : afficher le Cooldown le plus vide.

Pas de résumé textuel de type “X éléments à faire”.

### 11.6. Interaction depuis le widget

Comportement cible :

- l’utilisateur peut marquer un Cooldown comme fait depuis le widget ;
- l’action déclenche la mise à jour du Cooldown ;
- le widget se rafraîchit ;
- feedback court : **CoolDone**.

Fallback acceptable :

- si l’interaction directe est techniquement limitée, le tap ouvre l’app sur une page ultra simple du Cooldown ;
- cette page affiche un bouton principal **C’est fait** ;
- après validation, la jauge redevient pleine.

### 11.7. Widget configurable

Pour la V0, la règle automatique suffit : afficher les Cooldowns les plus vides.

Pas de configuration avancée par widget en V0.

---

## 12. App minimale

### 12.1. Rôle de l’app

L’app ne doit pas devenir un dashboard complexe.

Elle sert à :

- créer ;
- modifier ;
- supprimer ;
- consulter la liste complète ;
- gérer les notifications ;
- présenter le concept au premier lancement.

### 12.2. Écrans V0

#### 1. Onboarding court

Objectif : expliquer le concept en une ou deux étapes maximum.

Exemple :

```text
Des petits rythmes, sans pression.

Crée des Cooldowns pour les choses que tu veux refaire de temps en temps.
Ils se vident doucement dans ton widget.
```

Actions :

- créer un premier Cooldown ;
- demander l’autorisation de notification au bon moment, pas forcément au premier écran ;
- guider vers l’ajout du widget si nécessaire.

#### 2. Liste des Cooldowns

Liste simple, triée du plus vide au plus rempli.

Chaque item affiche :

- nom ;
- Cooleur via la barre ;
- barre ;
- bouton ou action **C’est fait**.

Pas de label d’état et pas de temps restant.

#### 3. Création d’un Cooldown

Champs :

- nom ;
- durée choisie dans la liste prédéfinie ;
- Cooleur ;
- notification activée ou non.

Règle obligatoire :

- à la création, le Cooldown commence toujours plein ;
- il n’y a pas d’option “je viens de le faire” ;
- il n’y a pas d’option pour démarrer vide.

#### 4. Modification d’un Cooldown

Permet de modifier :

- nom ;
- durée ;
- Cooleur ;
- notification ;
- éventuellement appliquer **C’est fait**.

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

### 12.3. Écrans exclus de la V0

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
- thème custom avancé ;
- color picker ;
- pause ;
- archive.

---

## 13. Création d’un Cooldown

### 13.1. Flow recommandé

Le flow de création doit être très court.

Étapes :

1. Nom du Cooldown.
2. Choix d’une durée dans la liste prédéfinie.
3. Choix ou validation de la Cooleur automatique.
4. Option notification.
5. Création.

À la validation, le Cooldown est créé avec `lastDoneAt = now` afin qu’il démarre plein.

### 13.2. Exemple de formulaire

```text
Nouveau Cooldown

Nom
[ Appeler maman ]

Rythme
[ 3j ] [ 5j ] [ 8j ]
[ 11j ] [ 12j ] [ 18j ]
[ 23j ] [ 27j ] [ 37j ]
[ 45j ] [ 53j ] [ 76j ]

Cooleur
[ Pastilles de couleur ]

Notification
[ ] Me prévenir à la fin du cycle

[ Créer le Cooldown ]
```

### 13.3. Validation

Règles :

- le nom est obligatoire ;
- la durée est obligatoire ;
- la durée doit faire partie de `COOLDOWN_DURATION_OPTIONS_DAYS` ;
- la Cooleur est obligatoire mais peut être auto-attribuée ;
- la notification est optionnelle ;
- tous les Cooldowns sont récurrents ;
- le Cooldown démarre toujours plein.

### 13.4. Nom

Le nom doit rester libre.

Limites recommandées :

- minimum : 1 caractère ;
- maximum : 60 caractères ;
- affichage widget : tronquer proprement si nécessaire.

### 13.5. Durée

La durée est choisie uniquement parmi les propositions prédéfinies.

En V0, les durées sont exprimées en jours.

Pas d’heures/minutes en V0.

### 13.6. État initial

Un nouveau Cooldown démarre toujours plein.

Il n’existe pas :

- d’option “je viens de le faire” ;
- d’option de départ vide ;
- d’écran demandant quand la tâche a été faite pour la dernière fois.

---

## 14. Action “C’est fait”

### 14.1. Définition

L’action **C’est fait** indique que l’utilisateur vient de réaliser le Cooldown.

Effets :

- `lastDoneAt` devient maintenant ;
- la jauge redevient pleine ;
- la couleur de barre revient au dérivé correspondant au niveau plein ;
- la notification suivante est reprogrammée si elle est activée ;
- le widget est rafraîchi ;
- le Cooldown peut redescendre dans la liste car il est maintenant plus rempli que les autres.

### 14.2. Feedback

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

### 14.3. Undo

La V0 ne propose pas d’undo.

Raison : garder le modèle de données et l’interface simples.

---

## 15. Notifications

### 15.1. Périmètre V0

La V0 inclut les notifications locales quand un Cooldown atteint 0 %.

Les notifications sont optionnelles par Cooldown.

### 15.2. Règles

- L’utilisateur choisit d’activer ou non une notification pour chaque Cooldown.
- Si la notification est activée, elle est programmée pour le moment où le Cooldown atteint 0 %.
- Si l’utilisateur appuie sur **C’est fait**, la notification suivante est recalculée.
- Si le Cooldown est déjà à 0 %, aucune notification répétée ne doit être envoyée.
- Pas de relance automatique quotidienne.

### 15.3. Wording

Titre recommandé :

```text
Ton Cooldown est arrivé au bout
```

Body possible :

```text
C’est peut-être le bon moment pour Appeler maman.
```

Alternative courte :

```text
Appeler maman t’attend tranquillement.
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

### 15.4. Autorisation

Ne pas demander l’autorisation de notification au premier lancement sans contexte.

Moment recommandé : lors de la création du premier Cooldown avec notification activée.

---

## 16. Données

### 16.1. Modèle Cooldown

Modèle conceptuel :

```ts
type Cooldown = {
  id: string
  name: string
  durationDays: number
  cooleurId: string
  notificationEnabled: boolean
  lastDoneAt: string
  createdAt: string
  updatedAt: string
  deletedAt?: string | null
}
```

Règle importante : `lastDoneAt` n’est pas nullable en V0, car un Cooldown démarre toujours plein à la création.

### 16.2. Données calculées

Ces valeurs ne doivent pas forcément être stockées. Elles peuvent être recalculées.

```ts
type CooldownComputedState = {
  elapsedRatio: number
  remainingRatio: number
  colorTier: CooldownColorTier
}
```

Pas de statut textuel calculé pour l’UI.

### 16.3. Calcul recommandé

```text
elapsed = now - lastDoneAt
cycle = durationDays en secondes
remainingRatio = max(0, 1 - elapsed / cycle)
elapsedRatio = min(1, elapsed / cycle)
colorTier = getCooldownColorTier(remainingRatio)
```

### 16.4. Seuils de couleur

Les seuils de couleur sont ceux définis dans `COOLDOWN_PROGRESS_THRESHOLDS` :

| remainingRatio | colorTier |
|---:|---|
| `> 0.50` | `dark` |
| `> 0.15 && <= 0.50` | `bright` |
| `>= 0 && <= 0.15` | `pastel` |

### 16.5. Stockage V0

La V0 est locale uniquement.

Pas de :

- compte ;
- backend ;
- login ;
- synchronisation ;
- partage.

Les données doivent être accessibles à l’app et au widget.

### 16.6. Suppression

La V0 peut supprimer définitivement un Cooldown.

Techniquement, un `deletedAt` peut être utile pour éviter les effets de bord avec les widgets, mais côté produit il n’y a pas d’archive.

---

## 17. Architecture produit V0

### 17.1. Objectif

Prouver que le concept widget-first est utile, simple et agréable.

### 17.2. Plateforme

- iPhone only.
- iOS moderne.
- App native SwiftUI recommandée.
- WidgetKit pour les widgets.
- Données locales.

### 17.3. Fonctionnalités incluses

#### Cooldowns

- Créer un Cooldown.
- Modifier un Cooldown.
- Supprimer un Cooldown.
- Marquer comme fait avec **C’est fait**.
- Tous les Cooldowns sont récurrents.
- Durées choisies parmi une liste fixe prédéfinie.
- Pas de durées calendaires rondes.
- Démarrage toujours plein à la création.

#### Visualisation

- Barre horizontale.
- Jauge pleine à la création.
- Jauge pleine après **C’est fait**.
- Jauge qui se vide au fil du temps.
- Jauge vide à 0 %.
- Pas de temps restant.
- Pas de label d’état.
- Pas de retard.
- Tri du plus vide au plus rempli.
- Couleur de barre basée sur trois dérivés de Cooleur.
- Seuils centralisés : 50 % et 15 %.

#### Cooleurs

- 12 Cooleurs prédéfinies.
- Chaque Cooleur possède 3 dérivés : sombre, lumineux, pastel.
- Cooleur obligatoire mais auto-attribuée par défaut.
- Pas de rouge.
- Pas de color picker.

#### Widgets

- Grand widget.
- Widget moyen.
- Petit widget si temps disponible après les deux premiers.
- Affichage automatique des Cooldowns les plus vides.
- Action **C’est fait** directement depuis le widget si possible.
- Fallback vers l’app si nécessaire.

#### Notifications

- Notification optionnelle par Cooldown.
- Notification envoyée quand le Cooldown atteint 0 %.
- Pas de relance répétée.
- Wording doux, sans retard, sans urgence, sans label d’état.

#### App

- Onboarding court.
- Liste des Cooldowns.
- Création.
- Modification.
- Suppression.
- Gestion basique des notifications.

### 17.4. Exclusions V0

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
- Pas de color picker.
- Pas de mode graphique avancé.
- Pas de génération dynamique de durées.
- Pas de temps restant.
- Pas de labels d’état.

---

## 18. Wording UI recommandé

### 18.1. Onboarding

```text
Des petits rythmes, sans pression.
```

```text
Crée des Cooldowns pour les choses que tu veux refaire de temps en temps.
Ils se vident doucement dans ton widget.
```

```text
Pas de retard. Pas de score. Juste un coup d’œil.
```

### 18.2. Création

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
Cooleur
```

```text
Me prévenir à la fin du cycle
```

```text
Créer le Cooldown
```

### 18.3. Action

```text
C’est fait
```

Feedback :

```text
CoolDone
```

### 18.4. Suppression

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

### 18.5. Notifications

Titre :

```text
Ton Cooldown est arrivé au bout
```

Body :

```text
C’est peut-être le bon moment pour Appeler maman.
```

Alternative :

```text
Appeler maman t’attend tranquillement.
```

---

## 19. Design principles

### 19.1. Ton visuel

Le produit doit être :

- doux ;
- clair ;
- moderne ;
- simple ;
- légèrement playful ;
- jamais alarmiste.

### 19.2. Couleurs

Règles :

- pas de rouge ;
- pas d’état d’erreur pour un Cooldown à 0 % ;
- pas de couleur agressive ;
- les Cooleurs doivent rester jolies même en widget ;
- priorité au contraste et à la lisibilité ;
- chaque Cooleur doit avoir trois dérivés cohérents.

### 19.3. Typographie

Recommandation :

- utiliser les standards iOS au départ ;
- ne pas surdesigner la V0 ;
- garder une hiérarchie claire entre nom, barre et action.

### 19.4. Animation

Animations V0 :

- très courtes ;
- uniquement pour confirmer une action ;
- jamais répétées de manière agressive.

Exemple :

- légère transition de la jauge vers plein après **C’est fait** ;
- apparition courte du feedback **CoolDone**.

---

## 20. Critères d’acceptation V0

### 20.1. Produit

La V0 est acceptable si :

- l’utilisateur peut créer un Cooldown en moins de 30 secondes ;
- il peut voir ses Cooldowns dans un widget ;
- les Cooldowns se vident correctement avec le temps ;
- un Cooldown à 0 % remonte automatiquement dans le tri ;
- aucun écran n’utilise la notion de retard ;
- aucun écran n’affiche de temps restant ;
- aucun Cooldown n’affiche de label d’état ;
- les Cooldowns sont triés du plus vide au plus rempli ;
- les notifications optionnelles fonctionnent ;
- le produit reste local-only.

### 20.2. UX

La V0 est acceptable si :

- l’app paraît simple ;
- le widget est lisible ;
- les couleurs ne donnent pas une impression d’alerte ;
- l’action **C’est fait** est évidente ;
- le feedback **CoolDone** est compréhensible ;
- les durées proposées sont faciles à choisir ;
- la variation de Cooleur suffit à comprendre la progression sans texte d’état.

### 20.3. Technique

La V0 est acceptable si :

- l’app et le widget lisent les mêmes données ;
- le widget se met à jour après une action ;
- les notifications sont reprogrammées après **C’est fait** ;
- la suppression retire bien le Cooldown du widget ;
- l’app fonctionne hors ligne ;
- aucune donnée personnelle n’est envoyée à un serveur ;
- les durées sont définies dans une source unique ;
- les seuils 50 % et 15 % sont définis dans une source unique ;
- tous les composants visuels utilisent la même logique de palier.

---

## 21. Questions ouvertes restantes

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

### Q3 — Liste finale des durées V0

La liste recommandée est :

```text
3, 5, 8, 11, 12, 18, 23, 27, 37, 45, 53, 76 jours
```

À valider selon le ressenti produit.

### Q4 — Palette finale des 12 Cooleurs

Il faut définir précisément :

- les 12 noms internes ;
- les 12 labels éventuels affichés ;
- les 3 dérivés de chaque Cooleur ;
- les valeurs hex finales ;
- le rendu sur fond clair et fond sombre selon le style widget retenu.

### Q5 — Wording notification final

Le wording doit éviter :

- retard ;
- urgence ;
- injonction ;
- label d’état.

Propositions actuelles :

```text
Ton Cooldown est arrivé au bout
```

```text
C’est peut-être le bon moment pour [nom].
```

---

## 22. Décisions actées

- Le produit s’appelle **CoolDone**.
- Le concept central est le **Cooldown**.
- Une couleur de Cooldown s’appelle une **Cooleur**.
- **Cool** signifie chill, détendu, agréable, pas froid.
- Les Cooldowns sont des tâches récurrentes.
- Tous les Cooldowns sont récurrents.
- Un Cooldown a un nom, une Cooleur, une durée et un réglage de notification optionnelle.
- La durée est choisie dans une liste fixe prédéfinie.
- Il n’y a pas de générateur dynamique de durées en V0.
- Il n’y a pas de saisie libre de durée.
- Les durées ne doivent pas être des cadences calendaires rondes.
- Le Cooldown démarre toujours plein à la création.
- Il n’y a pas d’option “je viens de le faire”.
- Le Cooldown est plein après **C’est fait**.
- Le Cooldown se vide au fil du temps.
- Un Cooldown vide reste vide jusqu’à la prochaine action **C’est fait**.
- Il n’y a aucune notion de retard.
- On n’affiche jamais depuis combien de temps un Cooldown est à 0 %.
- On n’affiche jamais de temps restant.
- On n’affiche aucun label d’état de Cooldown.
- Les Cooldowns sont triés du plus vide au plus rempli.
- La V0 est iPhone only.
- La V0 est widget-first.
- L’app est surtout un outil de configuration.
- La V0 utilise une barre horizontale.
- La V0 propose 12 Cooleurs.
- Chaque Cooleur a 3 dérivés : sombre, lumineux, pastel.
- Les paliers de couleur sont définis par `remainingRatio` avec les seuils 50 % et 15 %.
- Les seuils de progression doivent être définis à un seul endroit dans le code.
- Tous les composants visuels doivent utiliser la même logique de palier.
- Pas de rouge.
- Pas de color picker.
- Les notifications sont incluses en V0, optionnelles par Cooldown.
- Une notification est envoyée quand le Cooldown atteint 0 %.
- V0 : local-only.
- V0 : suppression.
- Pas d’archive.
- Pas de pause.

---

## 23. Synthèse V0 en une phrase

**CoolDone V0 est une app iPhone locale, widget-first, qui permet de créer des Cooldowns récurrents avec une durée choisie dans une liste prédéfinie et une Cooleur, de les voir se vider dans un widget, puis de les remettre à plein avec “C’est fait”, sans retard, sans temps restant, sans label d’état, sans score et sans pression.**
