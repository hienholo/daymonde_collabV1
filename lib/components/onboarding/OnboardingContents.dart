class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "RECRUTEUR",
    image: "assets/images/recruteur.jpeg",
    desc: "Faites profiter à vos proches, amis et familles L’offre DAYMOND et gagner juste qu’a 10 000 FCFA sur charque filleul enregistré et en plus Nous mettons tous à votre disposition pour recenser de manière professionnelle",
  ),
  OnboardingContents(
    title: "COURSIER",
    image: "assets/images/coursier.jpeg",
    desc:
    "Vous êtes une entreprise ou un particulier colla-boréz avec daymond de maniere profetionnelle et gagnez beaucoups plus d'argent.",
  ),
  OnboardingContents(
    title: "AMBASSADEUR",
    image: "assets/images/ambassadeur.jpeg",
    desc:
    "Représenter de manière physique DAYMONDdans votre ville et gagner un gain sur chaque transaction effectuée dans vos locaux.",
  ),
  OnboardingContents(
    title: "FOURNISSEUR",
    image: "assets/images/fourn.jpeg",
    desc:
    "Comme tous commerçant vous avez toujours besoin de client. Et "
        "nous avons toujours des clients potentiels..",
  ),
];