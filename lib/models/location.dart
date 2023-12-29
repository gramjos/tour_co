import 'location_fact.dart';

class Location {
  final int id;
  String name;
  String imagePath;
  String preImagePath;
  final List<LocationFact> facts;

  Location(this.id, this.name, this.imagePath, this.preImagePath, this.facts);

  static List<Location> fetchAll() {
    return [
      Location(
        1,
        'i trapped a bug in a box',
        'assets/images/the_bug.png',
        'assets/images/bug_in_box.png',
        [
          LocationFact('i trapped a bug in a box', """

i trapped a bug in a box and i hear it knock from within a cardboard box.

as I stare thru a screen it gave me a spook when i saw it there

i waited for the harm to dissipate and decided it did belong in my line of sight.

it wrestles inside its enclosure wrapped in darkness as it knocks, this bug knocks as i scoff and mock 

i sit here listening to the petitioning bug knock, unclear will it ever disappear

it was decided since our fates collided our mate will not resuscitate  

as the bug pleas i am carefree, all bugs die around me

 """),
        ],
      ),
      Location(
        2,
        'Space and time_2',
        'assets/images/Milwaukee_spatial_distribu.png',
        'assets/images/Milwaukee_spatial_distribu.png',
        [
          LocationFact('Summary',
              'While we could go on about the ethereal glow and seemingly endless heights of this bamboo grove on the outskirts of Kyoto, the sight\'s pleasures extend beyond the visual realm.'),
          LocationFact('How to Get There',
              'Kyoto airport, with several terminals, is located 16 kilometres south of the city and is also known as Kyoto. Kyoto can also be reached by transport links from other regional airports.'),
        ],
      ),
      Location(
        3,
        'Space and time_3',
        'assets/images/SimpleStaticMobilePage.png',
        'assets/images/pre_SimpleStaticMobilePage.PNG',
        [
          LocationFact('Summary',
              'While we could go on about the ethereal glow and seemingly endless heights of this bamboo grove on the outskirts of Kyoto, the sight\'s pleasures extend beyond the visual realm.'),
          LocationFact('How to Get There',
              'Kyoto airport, with several terminals, is located 16 kilometres south of the city and is also known as Kyoto. Kyoto can also be reached by transport links from other regional airports.'),
        ],
      ),
    ];
  }

  static Location? fetchByID(int locationID) {
    List<Location> l = Location.fetchAll();
    for (var i = 0; i < l.length; i++) {
      if (l[i].id == locationID) {
        return l[i];
      }
    }
    return null;
  }
}
