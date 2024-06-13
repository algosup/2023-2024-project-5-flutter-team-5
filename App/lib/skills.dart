import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

// Skills
class SkillCategory {
  final String categoryName;
  final List<String> skills;
  final Color color;

  SkillCategory({
    required this.categoryName,
    required this.skills,
    required this.color,
  });
}

List<SkillCategory> skillCategories = [
  SkillCategory(
    categoryName: 'Cognitive',
    skills: ['mémorisation', 'concentration', 'esprit critique', 'créativité', 'résilience', 'persévérence', 'curiosité intellectuel'],
    color: Colors.red
  ),
  SkillCategory(
    categoryName: 'Comportementale',
    skills: ['organisation', 'adaptabilité', 'autonomie', 'responsabilité', 'gestion du stress', 'initiative', 'auto-discipline', 'gestion du temps', 'audace', 'gestion du temps'],
    color: Colors.blue,
  ),
  SkillCategory(
    categoryName: 'Relationnelle',
    skills: ['communication', 'esprit d\'équipe', 'empathie', 'négociation', 'tolérance', 'confiance en soi', 'médiation', 'leadership', 'entretien de réseau'],
    color: Colors.green,
  ),
];

Map<String, Color> skillColorMap = {
  for (var category in skillCategories)
    for (var skill in category.skills) skill: category.color,
};

List<String> Personality = [
 'Architecte',
  'Logicien',
  'Commandant',
  'Innovateur',
  'Avocat',
  'Médiateur',
  'Protagoniste',
  'Inspirateur',
  'Logisticien',
  'Défenseur',
  'Directeur',
  'Consul',
  'Virtuose',
  'Aventurier',
  'Entrepreneur',
  'Amuseur',
];

List<String> Diplomas = [
  'Certificat d\'aptitude professionnelle (CAP)',
  'Brevet d\'études professionnelles (BEP)',
  'Mention complémentaire (MC)',
  'Certificat de formation générale (CFG)',
  'Baccalauréat général',
  'Baccalauréat technologique',
  'Baccalauréat professionnel',
  'Brevet de technicien (BT)',
  'Brevet des métiers d\'art (BMA)',
  'Diplôme d\'accès aux études universitaires (DAEU)',
  'Brevet de technicien supérieur (BTS)',
  'Diplôme universitaire de technologie (DUT)',
  'Diplôme d\'études universitaires scientifiques et techniques (DEUST)',
  'Brevet professionnel de la jeunesse, de l\'éducation populaire et du sport (BPJEPS)',
  'Licence',
  'Licence professionnelle',
  'Bachelor',
  'Diplôme national des métiers d’art et du design (DN MADE)',
  'Diplôme universitaire de technologie (BUT)',
  'Master',
  'Diplôme d\'ingénieur',
  'Diplôme d’État de docteur en médecine, en pharmacie, en chirurgie dentaire, en maïeutique',
  'Doctorat',
];  

List<String> activitySectors = [
  'Activités juridiques et comptables',
  'Agriculture et élevage',
  'Architecture, études et normes',
  'Artisanat d\'art, audiovisuel et spectacle',
  'Automobile',
  'Bâtiment et travaux publics',
  'Commerce et distribution',
  'Communication et marketing',
  'Culture et patrimoine',
  'Édition',
  'Énergie',
  'Enseignement et formation',
  'Environnement',
  'Finance, banque et assurance',
  'Gestion administrative et ressources humaines',
  'Hôtellerie et restauration',
  'Immobilier',
  'Industries',
  'Informatique et télécommunications',
  'Logistique et transport',
  'Maintenance, entretien et nettoyage',
  'Recherche',
  'Santé',
  'Service à la personne',
  'Service public, défense et sécurité',
  'Social',
  'Sport, animation et loisir',
  'Tourisme',
];

List<String> companyCategories = [
  'Grande entreprise',
  'Entreprise de taille intermédiaire',
  'Petite et moyenne entreprise',
  'Très petite entreprise'
];

List<String> contractTypes = [
  'CDI',
  'CDD',
  'Temps partiel',
  'Stage',
];
