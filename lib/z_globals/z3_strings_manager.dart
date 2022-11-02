class GameDialogs {
  // Basic dialogs
  static const String initialVillageMesssage =
      'Bonjour, je suis une future ange de la bienveillante haute ecole de sante du valais.\n\n'
      'Le diabete est un fleau qui ne cesse d\'augmenter.'
      ' Dans ce monde virtuel je vais apprendre comment le contrer'
      ' et proteger mon prochain atteint. '
      '\n\nOn y GO!?';

  // // Dialogs
  static const String initialBrocoliHome = 'Début de la mission 3 :\n\n'
      'Bienvenue dans la maison de M. Brocoli!.\n'
      'Dirigez-vous vers le patient pour commencer la mission.\n'
      '\n\nOn y GO!?';

  static const String returnToDefaultScene =
      'Vous ne pouvez pas re-effectuer cette scène.';

  static const String cantLeaveScene =
      'Vous devez terminer la mission avant de sortir.';

  // Mr. Moutarde Interactions
  // Dialog moutarde at HOME
  static const String returnToMoutardeHome =
      'Vous avez déjà rendu visite à Mr Moutarde.';
  static const String returnToVillageCMS =
      'Vous avez déjà fini votre travail au CMS.';

  static const String finishCMSBefore =
      'Vous devez terminer votre travail au CMS avant d\'accéder à l\'hôpital.';
  static const String visitMoutardeBefore =
      'Vous devez rendre visite à Mr Moutarde avant.';
  static const String visitMyrtilleBefore =
      'Vous devez rendre visite à Mme Myrtille avant.';

// Dialog moutarde at HOSPITAL

}

/// It's in this class that dialog with collision were defined
class MapCollisionInteractWith {
  static const String moutardeHouse =
      "J'espère que Monsieur Moutarde va bien !";
  static const String myrtilleHouse =
      "Faut pas que j'oublie de prendre des nouvelles de Madame Myrtille.";
  static const String brocoliHouse =
      "Ce serait bien de faire des brocolis pour ce soir.";
}

/// It's in this class that the planning is defined
class GameSituation {
  static const String situationsTitle = "Patients du village";

  ////CMS :
  // Patient 1 :

  static const String situation1Title = "Patient 1 – 08h00-09h00 :";
  static const String situation1Subtitle = "Monsieur Moutarde";
  static const String situation1Description = GameScenario.scenario1Context;

//Patient 2 :
  static const String situation2Title = "Patient 2 – 09h00-10h00 :";
  static const String situation2Subtitle = "Madame Myrtille";
  static const String situation2Description = GameScenario.scenario2Context;

// Patient 3 ;

  static const String situation3Title = "Patient 3 – 10h00-11h00 :";
  static const String situation3Subtitle = "Monsieur Brocoli";
  static const String situation3Description = GameScenario.scenario3Context;

////Hospital :
  static const String chambresTitle = "Chambres des patients a l'hopital";

// chambre 23 :

  static const String situation4Title = "Chambre 23 :";
  static const String situation4Subtitle = "Monsieur Brocoli";
  static const String situation4Description = GameScenario.scenario4Context;

// chambre 24 :

  static const String situation5Title = "Chambre 24 :";
  static const String situation5Subtitle = "Monsieur Fraiseux";
  static const String situation5Description = GameScenario.scenario5Context;

  static const String situation6Title = "Chambre 25 :";
  static const String situation6Subtitle = "Monsieur Laitue";
  static const String situation6Description = GameScenario.scenario6Context;

// chambre 26 :

  static const String situation7Title = "Chambre 26 :";
  static const String situation7Subtitle = "Monsieur Abricot";
  static const String situation7Description = GameScenario.scenario7Context;

  static const String situation8Title = "Ecole :";
  static const String situation8Subtitle = "Donner un cours";
  static const String situation8Description = GameScenario.scenario8Context;
}

class GameScenario {
  //// CMS
  // SITUATION 1
  static const String scenario1Context =
      "Votre premier patient est Monsieur Moutarde, âgé de 72 ans. Il est veuf, sans enfant et vit seul à domicile.\n\n"
      "Après avoir été diagnostiqué d’un diabète de type II à l’hôpital, il est de retour à domicile depuis la veille au soir."
      " C’est le premier matin où il doit gérer seul ses autosoins.\n\n"
      "Vous êtes chargée de poursuivre l’enseignement thérapeutique à domicile.";
  static const String scenario1Objective =
      "->Réaliser un recueil de données structuré\n\n"
      "->Evaluer l’état de santé d’un patient en priorisant les interventions infirmières\n\n"
      "->Identifier les signes et les symptômes de l’hypoglycémie";
  static const String scenario1Location =
      "Maison de Monsieur Moutarde (Nécessite présence d’un frigo)";
  static const String scenario1Charactere =
      "Monsieur Moutarde (patient), Margot (infirmière)";
  static const String scenario1BonusMalus =
      "L’étudiant commence le jeu avec une barre de qualité des soins reflétant un niveau moyen, barre remplie à 50%."
      "Dans cette situation : Pour chaque bonne réponse donnée lors de la première tentative, l’étudiant gagne 1 point de qualité des soins. Pour chaque mauvaise réponse lors de la première tentative, l’étudiant perd 1 point de qualité des soins. Lors des tentatives suivantes, qu’il choisisse la bonne ou la mauvaise réponse, l’étudiant ne gagne ou ne perd aucun point. Le message « Ce n’est pas la bonne réponse, retentez ! » s’affiche jusqu’à ce que l’étudiant trouve la bonne réponse. Lorsqu’il trouve la bonne réponse, le message « Félicitations ! Vous avez finalement trouvé la bonne réponse ! » s’affiche"
      "Dans cette situation : 13 possibilités de gagner ou de perdre 1 point.";

// Situation 2
  static const String scenario2Context =
      "Votre deuxième patiente est Madame Myrtille, âgée de 88 ans.\n\n"
      "Elle vit avec son mari et elle est non-adhérente à son traitement antidiabétique oral. C’est une patiente non-connue du CMS jusqu’à présent.\n\n"
      "Vous vous rendez à son domicile pour effectuer une première évaluation.";
  static const String scenario2Objective =
      "->Identification des complications du diabète sur le long terme";
  static const String scenario2Location = "Maison de Madame Myrtille";
  static const String scenario2Charactere =
      "Madame Myrtille (patiente), Margot (infirmière), mari de la patiente";
  static const String scenario2BonusMalus = "Dans cette situation :"
      "Questions à choix multiples : Pour chaque bonne réponse donnée lors de la première tentative, l’étudiant gagne 1 point de qualité des soins. Pour chaque mauvaise réponse lors de la première tentative, l’étudiant perd 1 point de qualité des soins. Lors des tentatives suivantes, qu’il choisisse la bonne ou la mauvaise réponse, l’étudiant ne gagne ou ne perd aucun point. Le message « Ce n’est pas la bonne réponse, retentez ! » s’affiche jusqu’à ce que l’étudiant trouve la bonne réponse. Lorsqu’il trouve la bonne réponse, le message « Félicitations ! Vous avez finalement trouvé la bonne réponse ! » s’affiche"
      "Question Vrai ou faux : comme seulement deux choix sont possibles, si l’étudiant répond faux à la première tentative, il n’a pas la possibilité de retenter."
      "Dans cette situation : 4 possibilités de gagner ou de perdre 1 point.";

// Situation 3
  static const String scenario3Context =
      "Votre dernier patient est Monsieur Brocoli, âgé de 84 ans, veuf, connu pour un diabète de type II et traité par antidiabétique oral.\n\n"
      "Malgré son âge avancé, Monsieur Brocoli ne présente pas de trouble cognitif. Cependant, il a un fort caractère et n’apprécie pas recevoir des recommandations du personnel médical et infirmier, il n’adhère pas toujours au traitement et aux autosoins.\n\n"
      "Vous vous rendez chez Monsieur Brocoli pour un contrôle de santé hebdomadaire. Ce jour-là, le fils est présent, il aimerait vous consulter car il est inquiet de l’état général de son papa qui diminue de jour en jour depuis une semaine. ";
  static const String scenario3Objective =
      "->Identifier les signes et les symptômes d’une hyperglycémie\n\n"
      "->Réaliser un examen physique\n\n"
      "->Transmettre des données à un professionnel de la santé en utilisant le SBAR";
  static const String scenario3Location = "Maison de Monsieur Brocoli";
  static const String scenario3Charactere =
      "Monsieur Brocoli (patient), Margot (infirmière), fils du patient";
  static const String scenario3BonusMalus = "Dans cette situation :"
      "Questions à choix multiples : Pour chaque bonne réponse donnée lors de la première tentative, l’étudiant gagne 1 point de qualité des soins. Pour chaque mauvaise réponse lors de la première tentative, l’étudiant perd 1 point de qualité des soins. Lors des tentatives suivantes, qu’il choisisse la bonne ou la mauvaise réponse, l’étudiant ne gagne ou ne perd aucun point. Le message « Ce n’est pas la bonne réponse, retentez ! » s’affiche jusqu’à ce que l’étudiant trouve la bonne réponse. Lorsqu’il trouve la bonne réponse, le message « Félicitations ! Vous avez finalement trouvé la bonne réponse ! » s’affiche"
      "Question Vrai ou faux : comme seulement deux choix sont possibles, si l’étudiant répond faux à la première tentative, il n’a pas la possibilité de retenter."
      "Dans cette situation : 5 possibilités de gagner ou de perdre 1 point."
      "Bonus quête : gain de 1 point";

// Situation 4

  static const String scenario4Context =
      "Suite à l’intervention du CMS, Monsieur Brocoli a été admis hier dans le service de médecine interne pour un état hyperglycémique en raison"
      " d’une probable non-observance du traitement antidiabétique oral.\n\n"
      "Aux urgences, au vu de la diminution de son état général, de la toux et de sa température tympanique, les médecins suspectaient également un état infectieux.\n\n"
      "Une radiographie thoracique a été réalisée et a révélé la présence d’un foyer pulmonaire gauche. ";
  static const String scenario4Objective =
      "->Agir en tant que praticien-ne réflexif-ve dans une situation de soin où un patient est hospitalisé pour un état hyperglycémique ";
  static const String scenario4Location = "Chambre de Monsieur Brocoli";
  static const String scenario4Charactere =
      "Monsieur Brocoli (patient), Marco (infirmier)";
  static const String scenario4BonusMalus = "Dans cette situation :"
      "Questions à choix multiples : Pour chaque bonne réponse donnée lors de la première tentative, l’étudiant gagne 1 point de qualité des soins. Pour chaque mauvaise réponse lors de la première tentative, l’étudiant perd 1 point de qualité des soins. Lors des tentatives suivantes, qu’il choisisse la bonne ou la mauvaise réponse, l’étudiant ne gagne ou ne perd aucun point. Le message « Ce n’est pas la bonne réponse, retentez ! » s’affiche jusqu’à ce que l’étudiant trouve la bonne réponse. Lorsqu’il trouve la bonne réponse, le message « Félicitations ! Vous avez finalement trouvé la bonne réponse ! » s’affiche"
      "Question Vrai ou faux : comme seulement deux choix sont possibles, si l’étudiant répond faux à la première tentative, il n’a pas la possibilité de retenter."
      "Dans cette situation : 3 possibilités de gagner ou de perdre 1 point.";

// Situation 5

  static const String scenario5Context =
      "Il s’agit de Monsieur Fraiseux, âgé de 38 ans, hospitalisé dans le service à la suite d’un séjour aux soins continus de cardiologie pour un infarctus du myocarde. Le patient exerce la profession de comptable à 100%. Il dit être très stressé par son travail. Il ne pratique aucune activité physique et fume deux paquets de cigarettes par jour. Ses valeurs glycémiques sont légèrement plus hautes que la norme, il se situe dans une phase « prédiabète ». Le médecin lui conseille alors d’agir sur ses différents facteurs de risque. ";
  static const String scenario5Objective =
      "->Identifier les facteurs de risque et les facteurs protecteurs en lien avec le diabète\n\n"
      "->Promouvoir la santé et prévenir la maladie en délivrant un enseignement spécifique à la situation d’un patient"
      "->S’inscrire dans une prise en charge interdisciplinaire pour assurer la continuité des soins en lien avec la transition entre l’hôpital et le domicile";
  static const String scenario5Location =
      "Chambre du patient où sont disposés les objets suivants : tablette de chocolat, téléphone portable, cigarettes, brochure pour un club de sport";
  static const String scenario5Charactere =
      "Monsieur Fraiseux (patients) et Marco (infirmier)";
  static const String scenario5BonusMalus =
      "Dans cette situation : gain de 5 points en lien avec l’enseignement thérapeutique"
      "Question avec sélection de professionnels dans le sac à dos : possibilité de gagner ou perdre 1 point";

// Situation 6

  static const String scenario6Context =
      "Madame Laitue, âgée de 56 ans, a été admise pour passer un examen d’investigation. Elle est connue pour un diabète de type II et doit être à jeun pour son examen.";
  static const String scenario6Objective =
      "->Agir en tant que praticien-ne réflexif-ve dans une situation de soin où un patient diabétique doit rester à jeun";
  static const String scenario6Location =
      "Chambre de Madame Laitue avec plateau repas";
  static const String scenario6Charactere =
      "Madame Laitue (patiente), Marco (infirmier)";
  static const String scenario6BonusMalus = "Dans cette situation :"
      "Questions à choix multiples : Pour chaque bonne réponse donnée lors de la première tentative, l’étudiant gagne 1 point de qualité des soins. Pour chaque mauvaise réponse lors de la première tentative, l’étudiant perd 1 point de qualité des soins. Lors des tentatives suivantes, qu’il choisisse la bonne ou la mauvaise réponse, l’étudiant ne gagne ou ne perd aucun point. Le message « Ce n’est pas la bonne réponse, retentez ! » s’affiche jusqu’à ce que l’étudiant trouve la bonne réponse. Lorsqu’il trouve la bonne réponse, le message « Félicitations ! Vous avez finalement trouvé la bonne réponse ! » s’affiche"
      "Question Vrai ou faux : comme seulement deux choix sont possibles, si l’étudiant répond faux à la première tentative, il n’a pas la possibilité de retenter."
      "Dans cette situation : 3 possibilités de gagner ou de perdre 1 point.";

// Situation 7

  static const String scenario7Context =
      "Il s’agit de Monsieur Abricot, 48 ans, qui exerce le métier d’ouvrier agricole à 100%. Monsieur s’est rendu chez son médecin traitant à cause d’un état fébrile et une baisse de l’état général. Lors de l’examen physique, le médecin observe une plaie avec la présence de signes inflammatoires sur la cheville droite du patient. Le patient dit qu’il s’est blessé 11 jours auparavant. Le médecin décide d’hospitaliser Monsieur Abricot. Durant l’hospitalisation, un diabète de type II lui est diagnostiqué.";
  static const String scenario7Objective =
      "->Exercer un rôle de leader et pratiquer la délégation des soins\n\n"
      "->Collaborer au sein d’une équipe interdisciplinaire\n\n"
      "->Etablir des liens physiopathologiques";
  static const String scenario7Location =
      "Bureau infirmier, couloir, chambre de Monsieur Abricot";
  static const String scenario7Charactere =
      "Marco (infirmier), Médecin, ASSC, infirmière en diabétologie, infirmière spécialisée en plaies, Monsieur Abricot (patient)";
  static const String scenario7BonusMalus = "Dans cette situation : "
      "Les questions avec deux choix de réponses : l’étudiant gagne 1 point s’il répond correctement à la première tentative. Il perd 1 point s’il répond faux lors de la première tentative. Comme il n’y a que deux choix, il n’a pas la possibilité de retenter "
      "La question à choix multiples : si l’étudiant donne la bonne réponse lors de la première tentative, il gagne 1 point de qualité des soins. S’il donne la mauvaise réponse lors de la première tentative, l’étudiant perd 1 point de qualité des soins. Lors des tentatives suivantes, qu’il choisisse la bonne ou la mauvaise réponse, l’étudiant ne gagne ou ne perd aucun point. Le message « Ce n’est pas la bonne réponse, retentez ! » s’affiche jusqu’à ce que l’étudiant trouve la bonne réponse. Lorsqu’il trouve la bonne réponse, le message « Félicitations ! Vous avez finalement trouvé la bonne réponse ! » s’affiche."
      "Dans cette situation : possibilité de gagner ou perdre 6 points"
      "Bonus quête : gain de 1 point";

// Situation 8

  static const String scenario8Context =
      "Vous êtes mandaté par une école de soins infirmiers pour intervenir dans un cours traitant de la physiopathologie du diabète. ";
  static const String scenario8Objective =
      "->Etablir des liens physiopathologiques\n\n"
      "->Maintenir et développer ses compétences professionnelles à travers une formation continue et soutenir la formation professionnelle pratique des étudiant-e-s, en s’appuyant sur des données scientifiques et pertinentes";
  static const String scenario8Location =
      "Salle de classe avec ordinateur, salle des professeurs";
  static const String scenario8Charactere =
      "Marco (infirmier), au minimum 5 étudiants (ceux qui posent les questions)";
  static const String scenario8BonusMalus =
      "Dans cette situation, qu’il s’agisse d’une question à choix multiples ou d’un « vrai ou faux », l’étudiant n’a qu’une seule tentative. "
      "Dans cette situation, 6 possibilités de gagner ou perdre 1 point"
      "Bonus professeur 3 : gain de 1 point "
      "Bonus quête : gain de 1 point ";
}
