import 'package:flutter/material.dart';

// Skills
class SkillCategory {
  final String categoryName;
  final List<String> skills;

  SkillCategory({required this.categoryName, required this.skills});
}

List<SkillCategory> skillCategories = [
  SkillCategory(
    categoryName: 'Cognitive',
    skills: ['mémorisation', 'concentration', 'esprit critique', 'créativité', 'résilience', 'persévérence', 'curiosité intellectuel'],
  ),
  SkillCategory(
    categoryName: 'Comportementale',
    skills: ['organisation', 'adaptabilité', 'autonomie', 'responsabilité', 'gestion du stress', 'initiative', 'auto-discipline', 'gestion du temps', 'audace', 'gestion du temps'],
  ),
  SkillCategory(
    categoryName: 'Relationnelle',
    skills: ['communication', 'esprit d\'équipe', 'empathie', 'négociation', 'tolérance', 'confiance en soi', 'médiation', 'leadership', 'entretien de réseau'],
  ),
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
