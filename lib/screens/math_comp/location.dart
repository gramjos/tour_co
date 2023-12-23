class Location {
  const Location({
    required this.name,
    required this.place,
    required this.imageUrl,
  });

  final String name;
  final String place;
  final String imageUrl;
}

const locations = [
  Location(
    name: 'Mount Rushmore',
    place: 'U.S.A',
    imageUrl: 'wetForest.jpeg',
  ),
  Location(
    name: 'Gardens By The Bay',
    place: 'Singapore',
    imageUrl: 'HammockView.jpeg',
  ),
  Location(
    name: 'Machu Picchu',
    place: 'Peru',
    imageUrl: 'HumboldtParkPond.jpeg',
  ),
  Location(
    name: 'Vitznau',
    place: 'Switzerland',
    imageUrl: 'MountainsFromOldRanchRoad.jpeg',
  ),
  Location(
    name: 'Jokulsarlon',
    place: 'Iceland',
    imageUrl: 'JokulsarlonIceland.jpg',
  ),
  Location(
    name: 'Bali',
    place: 'Indonesia',
    imageUrl: 'NokomisFromGreenBenches.jpeg',
  ),
  Location(
    name: 'Mexico City',
    place: 'Mexico',
    imageUrl: 'cc_view.jpeg',
  ),
  Location(
    name: 'Cairo',
    place: 'Egypt',
    imageUrl: 'rooftopFarm.jpeg',
  ),
];
