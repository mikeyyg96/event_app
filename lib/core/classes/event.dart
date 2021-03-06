import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String name, description, category, image, organization, userID, price, distance;
  final Timestamp date;
  // Soon will have a GeoPoint

  Event({
    this.name,
    this.description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Id ornare arcu odio ut sem nulla. Et pharetra pharetra massa massa ultricies. Diam ut venenatis tellus in metus vulputate eu. Varius quam quisque id diam vel. Vulputate dignissim suspendisse in est. Odio tempor orci dapibus ultrices in. Sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi. Lacus viverra vitae congue eu consequat ac. Enim sed faucibus turpis in eu mi bibendum neque egestas. Dui faucibus in ornare quam. Vel facilisis volutpat est velit. Suspendisse ultrices gravida dictum fusce ut placerat orci nulla.Sit amet nisl purus in. Viverra aliquet eget sit amet tellus. Fames ac turpis egestas maecenas pharetra. Diam maecenas sed enim ut. Ut consequat semper viverra nam. Risus at ultrices mi tempus imperdiet nulla malesuada pellentesque elit. Ultricies mi eget mauris pharetra et ultrices. Facilisis volutpat est velit egestas dui. Risus pretium quam vulputate dignissim. Suspendisse in est ante in nibh. Venenatis cras sed felis eget velit aliquet sagittis id consectetur. Et sollicitudin ac orci phasellus. At tellus at urna condimentum mattis pellentesque id nibh. Nec sagittis aliquam malesuada bibendum arcu vitae elementum. Ante metus dictum at tempor commodo ullamcorper.Vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere. Urna et pharetra pharetra massa massa ultricies mi quis. Tortor condimentum lacinia quis vel eros donec ac odio tempor. Tristique nulla aliquet enim tortor. Natoque penatibus et magnis dis parturient montes nascetur. Elit at imperdiet dui accumsan. Nulla pharetra diam sit amet nisl suscipit adipiscing bibendum est. Libero volutpat sed cras ornare arcu dui. Magna ac placerat vestibulum lectus mauris ultrices eros in cursus. Eros in cursus turpis massa tincidunt. Rhoncus est pellentesque elit ullamcorper dignissim cras. Enim nunc faucibus a pellentesque sit. Scelerisque in dictum non consectetur a erat. Aliquet risus feugiat in ante metus dictum at tempor.At urna condimentum mattis pellentesque id nibh. Eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus. Ac felis donec et odio. Nisl vel pretium lectus quam id leo in. Sed velit dignissim sodales ut eu sem integer vitae justo. Tempor orci dapibus ultrices in iaculis nunc sed augue lacus. Tortor posuere ac ut consequat semper viverra nam libero justo. Sagittis purus sit amet volutpat consequat mauris nunc congue. Malesuada fames ac turpis egestas integer eget aliquet nibh. Pharetra convallis posuere morbi leo. Sit amet purus gravida quis. At volutpat diam ut venenatis tellus in metus. Commodo viverra maecenas accumsan lacus vel facilisis volutpat est velit. Condimentum id venenatis a condimentum vitae.Integer malesuada nunc vel risus commodo. In ante metus dictum at tempor. Dignissim enim sit amet venenatis urna. In iaculis nunc sed augue lacus viverra vitae. Tellus molestie nunc non blandit massa enim. Leo urna molestie at elementum eu. A diam maecenas sed enim ut sem viverra aliquet. Tortor at auctor urna nunc. Volutpat lacus laoreet non curabitur gravida arcu ac tortor dignissim. Neque sodales ut etiam sit amet nisl',
    this.category,
    this.image,
    this.organization,
    this.distance,
    this.price,
    this.date,
    this.userID
  });
}
