import '../a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_4_game_dialogs/dialog_model.dart';
import '../a_overlays/a2_bag_overlay/a2_4_professional_contacts/a2_4_1_contacts_ui_material/contact_model.dart';

const String defaultDialog =
    "Vous n'êtes pas entrain de joindre le contact adapté à la situation.";

final List<DialogModel> urgence = <DialogModel>[
  DialogModel(
    hasInteraction: true,
    interaction: ["contacts", "Urgences médicales", false],
    isShowDialog: true,
    question:
        "Une personne responsable de la centrale téléphonique des urgences vous répond.\n"
        "Quel outil de communication allez-vous utiliser pour effectuer des transmissions pertinentes et structurées ?\n",
    dialogType: DialogType.questionRadioButton,
    answers: [
      {
        "result": false,
        "answer": "EVA",
      },
      {
        "result": true,
        "answer": "SBAR",
      },
      {
        "result": false,
        "answer": "ABCDE",
      }
    ],
    hasNext: true,
    index: 0,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Bravo !\n "
        "Vous avez sélectionné le bon outil.\n",
    hasNext: true,
    index: 1,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Maintenant vous allez devoir choisir quel est le bon SBAR parmi 3 propositions. \n"
        "Soyez concentré car chaque proposition ne sera affichée qu’une seule fois. \n ",
    hasNext: true,
    index: 2,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "SBAR1 \n\n"
        "Bonjour, je suis infirmière. J’ai besoin d’une ambulance de toute urgence. \n"
        "Mon patient va très mal. Il somnole, ses paramètres vitaux sont anormaux ! Il n’est pas orienté dans tous les modes ! \n"
        "Je sais qu’il est connu pour un diabète de type II. Son fils me dit que son état se péjore depuis quelques jours. \n"
        "Je suis très inquiète ! Venez vite !  \n ",
    hasNext: true,
    index: 3,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "SBAR2 \n\n"
        "Bonjour, je suis infirmière au CMS. Je vous appelle au sujet de Monsieur Brocoli, âgé de 84 ans, connu pour un diabète de type 2 traité uniquement par ADO. \n"
        "Selon son fils, il présente une baisse de l’état général depuis une semaine ainsi qu’une polyurie, une polyphagie et une polydipsie. \n"
        "Actuellement,  il est somnolent, mais réveillable lors de la stimulation verbale. Il est désorienté dans le temps et l’espace. \n"
        "Il a une température à 37.5oC, un FC à 98 bpm, une TA à 100/60 mmHg , une FR à 22/min, une sat à 90% et une glycémie à 40 mmol/L. \n"
        "Le patient est dans un état hyperglycémique avancé. Je crains que son état se péjore et qu’il fasse un coma hyperosmolaire.  \n"
        "Pouvez-vous envoyer une ambulance à l’adresse suivante : Chemin du Brocoli 3 ?\n",
    hasNext: true,
    index: 4,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "SBAR3 \n\n"
        "Bonjour, je suis infirmière au CMS. Je vous appelle au sujet de Monsieur Brocoli, âgé de 84 ans, connu pour un diabète de type 2. \n"
        "Actuellement,  le patient est somnolent, mais réveillable lors de la stimulation verbale. Il est désorienté dans le temps et l’espace. \n"
        " Il a une température à 37.5oC, un FC à 98 bpm, une TA à 100/60 mmHg , une FR à 22/min, une sat à 90% et une glycémie à 40 mmol/L. \n"
        "Le patient est dans un état hyperglycémique avancé. \n"
        "Je crains que son état se péjore et qu’il fasse un coma hyperosmolaire. Pouvez-vous envoyer une ambulance ? \n",
    hasNext: true,
    index: 5,
  ),
  DialogModel(
    isShowDialog: true,
    dialogType: DialogType.questionRadioButton,
    question: "Quel est le bon SBAR ?",
    answers: [
      {
        "result": false,
        "answer": "SBAR1",
      },
      {
        "result": true,
        "answer": "SBAR2",
      },
      {
        "result": false,
        "answer": "SBAR3",
      }
    ],
    hasNext: true,
    index: 6,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage: "Bravo ! \n\n"
        "Vous effectuez des transmissions structurées selon le SBAR en évoquant"
        " la situation actuelle (S), les antécédents (B), l’évaluation clinique ou « assessment » (A) et en recommandant une intervention (R). \n",
    hasNext: true,
    index: 7,
  ),
  DialogModel(
    isShowDialog: true,
    dialogMessage:
        "Grâce à vos connaissances et vos compétences, une ambulance s’est rendue au domicile du patient afin de le transférer dans un service de médecine interne. \n"
        "Votre prise en charge est terminée. \n"
        "Dans cette situation, vous avez acquis les compétences suivantes :"
        " identification des signes et symptômes d’une hyperglycémie, réalisation d’un examen physique"
        " et transmission de données à un professionnel de la santé en utilisant le SBAR.\n\n",
    hasNext: false,
    index: 9,
  ),
];

final List<ContactModel> contactList = [
  ContactModel(
    name: "Urgences médicales",
    phoneNumber: "144",
    image: "urgence.png",
    isReachable: true,
    hasDialogList: true,
    listDialog: urgence,
  ),
  ContactModel(
    name: "Médecin traitant",
    phoneNumber: "+41 786 65 85",
    image: "medecin.png",
  ),
  ContactModel(
    name: "Bureau du CMS",
    phoneNumber: "+41 786 65 87",
    image: "cms.png",
  ),
  ContactModel(
    name: "Diététicienne",
    phoneNumber: "+41 786 65 86",
    image: "dieteticiene.png",
  ),
  ContactModel(
    name: "Physiothérapeute en réadaptation cardiovasculaire",
    phoneNumber: "+41 786 65 89",
    image: "physio.png",
  ),
  ContactModel(
    name: "Infirmière de liaison",
    phoneNumber: "+41 786 65 87",
    image: "infirmiere.png",
  ),
  ContactModel(
    name: "Tabacologue",
    phoneNumber: "+41 786 65 88",
    image: "tabacologue.png",
  ),
  ContactModel(
    name: "Aumônier",
    phoneNumber: "+41 745 56 21",
    image: "aumonier.png",
  ),
];
