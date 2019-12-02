class DeckCoverPhoto {
  final String id;
  // final int width;
  // final int height;
  //final String description;

  //TODO: this will change.. right now it is the url for small size.. I will have custom sizes
  final String url;

  DeckCoverPhoto({this.id, this.url});

  factory DeckCoverPhoto.fromJson(Map<String, dynamic> json) {
    return DeckCoverPhoto(
      id: json['id'],
      // TODO: IM ALWAYS GRABBING THE SMALL ONE.. CHANGE THIS LATER
      url: json['urls']['small'],
    );
  }
}
