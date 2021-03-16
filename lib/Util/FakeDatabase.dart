import 'package:flutter/cupertino.dart';

class FakeDatabase{

  List<Product> get productList => _productlist;



  List<Product> _productlist=[

          Product(0,'chicken',
              [
            'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg',
            'https://www.refrigeratedfrozenfood.com/ext/resources/NEW_RD_Website/DefaultImages/default-pasta.jpg?1430942591',
            'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg'
             ],
              null,170,'Praesent cursus orci non nisl vestibulum, tempor tempus urna gravida.'
          ),
    Product(1,'Cheeseburger',
        [
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg',
          'https://www.refrigeratedfrozenfood.com/ext/resources/NEW_RD_Website/DefaultImages/default-pasta.jpg?1430942591',
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg'
        ],
        null,160,'Praesent cursus orci non nisl vestibulum, tempor tempus urna gravida.'
    ),
    Product(2,'KFC Original Recipe Chicken',
        [
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg',
          'https://www.refrigeratedfrozenfood.com/ext/resources/NEW_RD_Website/DefaultImages/default-pasta.jpg?1430942591',
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg'
        ],
        450,360,'Praesent cursus orci non nisl vestibulum, tempor tempus urna gravida.'
    ),
    Product(3,'White Castle Sliders',
        [
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg',
          'https://www.refrigeratedfrozenfood.com/ext/resources/NEW_RD_Website/DefaultImages/default-pasta.jpg?1430942591',
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg'
        ],
        550,460,'Praesent cursus orci non nisl vestibulum, tempor tempus urna gravida.'
    ),
    Product(4,'Roast Beef Sandwich',
        [
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg',
          'https://www.refrigeratedfrozenfood.com/ext/resources/NEW_RD_Website/DefaultImages/default-pasta.jpg?1430942591',
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg'
        ],
        650,560,'Praesent cursus orci non nisl vestibulum, tempor tempus urna gravida.'
    ),

    Product(5,'Sonic Cherry Limeade',
        [
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg',
          'https://www.refrigeratedfrozenfood.com/ext/resources/NEW_RD_Website/DefaultImages/default-pasta.jpg?1430942591',
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg'
        ],
        650,560,'Praesent cursus orci non nisl vestibulum, tempor tempus urna gravida.'
    ),
    Product(6,'Tortellini Alfredo',
        [
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg',
          'https://www.refrigeratedfrozenfood.com/ext/resources/NEW_RD_Website/DefaultImages/default-pasta.jpg?1430942591',
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg'
        ],
        650,560,'Praesent cursus orci non nisl vestibulum, tempor tempus urna gravida.'
    ),
    Product(7,'Krispy Kreme Original Glazed Doughnuts',
        [
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg',
          'https://www.refrigeratedfrozenfood.com/ext/resources/NEW_RD_Website/DefaultImages/default-pasta.jpg?1430942591',
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg'
        ],
        750,580,'Praesent cursus orci non nisl vestibulum, tempor tempus urna gravida.'
    ),
    Product(8,'Taco Bell Burrito Supreme',
        [
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg',
          'https://www.refrigeratedfrozenfood.com/ext/resources/NEW_RD_Website/DefaultImages/default-pasta.jpg?1430942591',
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg'
        ],
        850,560,'Praesent cursus orci non nisl vestibulum, tempor tempus urna gravida.'
    ),
    Product(9,'Happy Meal',
        [
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg',
          'https://www.refrigeratedfrozenfood.com/ext/resources/NEW_RD_Website/DefaultImages/default-pasta.jpg?1430942591',
          'https://images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg'
        ],
        1150,860,'Praesent cursus orci non nisl vestibulum, tempor tempus urna gravida.'
    ),
  ];

}



class Product{

  final int id;
  final String name;
  final List<String> images;
  final double regularPric;
  final double discountPrice;
  final String description;
  //final double


  Product(this.id,this.name,this.images,this.regularPric,this.discountPrice,this.description);

}