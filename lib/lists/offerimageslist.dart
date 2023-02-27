import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myproject/lists/alloffers.dart';
import 'package:myproject/pages/animalgridkist.dart';

class ImageContainer extends StatefulWidget {
  final List<Widget> images;

  ImageContainer(this.images);

  @override
  _ImageContainerState createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  int _index = 0;
  int scroll = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _index++;
        scroll++;
        if (_index >= widget.images.length) _index = 0;
        if (scroll >= widget.images.length) scroll = 1;
        if (_index == scroll) scroll++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductGrid(AllOffers().dryfoods)
            ));
      },
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .5,
            child: widget.images[_index],
          ),
          Container(
            width: MediaQuery.of(context).size.width * .5,
            child: widget.images[scroll],
          ),
        ],
      ),
    );
  }
}















class OfferImages {
  List<Widget> offerImages = [
    Image.network(
        "https://d168jcr2cillca.cloudfront.net/uploadimages/sale_mainpic_20081230130245Bittoo-The-Pet-Shop.jpg"),
    Image.network(
        "https://images-eu.ssl-images-amazon.com/images/G/31/img19/Pets/DogDay/Pedigree_750x375.png"),
    Image.network(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0nEwzLnksAlZRcvCf89XOT_xpTzQRMK6EMg&usqp=CAU"),
    Image.network(
        "https://www.marshallspetzone.com/img/magicslideshow/SUPPLEMENTS%20SLIDER%201920800.jpg"),
    Image.network(
        "https://www.marshallspetzone.com/img/magicslideshow/DROOLS%20SLIDER%201920800.jpg")
  ];
  List<Widget> secondOfferImages = [
    Image.network(
        "https://www.marshallspetzone.com/img/cms/WHISKAS%200212.jpg"),
    Image.network(
        "https://www.marshallspetzone.com/img/cms/pawzone%20dog%20shoes_1.jpg"),
    Image.network(
        "https://www.marshallspetzone.com/img/cms/DROOLS%20GRID%2014112022.jpg"),
    Image.network(
        "https://www.marshallspetzone.com/img/cms/JAN%20UPDATE/jan%20update%202/1%20(14).jpg"),
    Image.network(
        "https://www.marshallspetzone.com/img/cms/dogtoysgridnew.jpg"),
  ];
  List<dynamic> imageUrls = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkCFvNt8NMeobg5oxu0NvtYQy1bpXV-jY0aw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTju-m800LVW_MIDgey6pyaichNlvn7Uscaqw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxIw2P3t3souW-aD_8QPbaZw_xsEqlkV77Ig&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwdneP86fyUOmz8jLqNmuOCLq-l_fs39fnuA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP7k-CsNZ_n4V-PJiM8lD_Jj0vy73nSJO57g&usqp=CAU",
  ];
}


class OffersThrid {
  List<dynamic> dryfoods = [
    {
      "names": "Royal Canin Labrador Puppy Dog Food 3 kg",
      "price": 2130.00,
      "KEY FEATURES":
          """Generous protein content for building lean muscle mass and endurance.
Kibble shape and size that are custom made for Labrador pups.
Natural fibres promote healthy digestion and bowel movement.
Omega fatty acids improve cognitive functions and skin health.
Super antioxidants flush out toxins from the puppy’s body.""",
      "images": NetworkImage(
          "https://cdn.petsworld.network/v1/s/images/A3A7AE0AE8DBDCB0FE49FB5334AA43A8/1920.webp")
    },
    {
      "names": "Fidele Light & Senior Adult Dog Food 1 Kg",
      "price": 645.00,
      "KEY FEATURES":
          """Top quality ingredients offer rich protein for maintaining good muscle mass and strength.
Organic sources of glucosamine and chondroitin give an anti-inflammatory effect by reducing pain in bones and joints.
Essential vitamins and minerals provide anti-ageing properties and boost overall immunity.
A healthy blend of Omega 3 and Omega 6 fatty acids for nourishing skin and coat of the canine.
An absolutely gluten-free diet for making it suitable for allergic dogs.""",
      "images": NetworkImage(
          "https://cdn.petsworld.network/v1/s/images/2542B5921D532168B8518AD0395DC74F/1920.webp")
    },
    {
      "names": "Mera Essential Junior 2 Dog Food 4 Kg",
      "price": 2880.00,
      "KEY FEATURES":
          """ Complete food for large breeds puppies after the 6th month.
Supporting the immune system
Tailored towards the individual needs of your dog
Joint protection , Recipe without wheat , With reduced energy content
With MERA protection concepts , All-round care for young dogs
Young dogs of all breeds (final weight >40 kg) from 6 months old to adulthood.  """,
      "images": NetworkImage(
          " https://cdn.petsworld.network/v1/s/images/9F1B6534ABEED30E1C8ABD2A8A550297/1920.webp")
    },
    {
      "names": "Mera Pure Sensitive Lamb & Rice Adult Dog Food 12.5 kg",
      "price": 7830.00,
      "KEY FEATURES":
          """Apt food for all adult dogs experiencing food intolerance
Consists of delicious Lamb and Rice as main ingredients
Excellent source of animal protein and source of carbohydrate
A recipe without ingredients consisting of Gluten
Highly tolerant food for all breeds of dogs """,
      "images": NetworkImage(
          "https://cdn.petsworld.network/v1/s/images/A1BFB6C08FDE6480C1813369BF8F9CA0/1920.webp")
    },
  ];
  List<dynamic> chewToy = [
    {
      "names": "Petsworld Squeaky Paw Print Rubber Bone Chew Dog Toy",
      "price": 200.00,
      "KEY FEATURES": """Flexible & Non-Toxic Rubber Chew Toy
Improves Dental Health
Super Durable
Encourages Non-Destructive Chewing
Suitable For all Dog """,
      "images": NetworkImage(
          "https://cdn.petsworld.network/v1/s/images/59803FDA8143492512AF4ABABA2616F6/256.webp")
    },
    {
      "names": "Iseo Chemdis Blue Jack Squeaky Rubber Large Toy For Dog & Cat",
      "price": 599.00,
      "KEY FEATURES":
          """Como toys combine a soft, velvety outer-layer with a super squeezy
Squishy foam makes como toys ultra-bouncy & a super-sensitive squeaker guarantees a squeak with every bounce.
The innovative design that is engineered to be dog-friendly
Rubber foam inner-layer that's designed to be gentle on dogs' jaws and teeth.
Not suitable for heavy chewers, and puppies who like to shred toys
Como! toys are great for dogs """,
      "images": NetworkImage(
          "https://cdn.petsworld.network/v1/s/images/3523B3F3E2B9CDC305D2FF93E5CD361B/256.webp")
    },
    {
      "names":
          "Iseo Chemdis Red Beehive Squeaky Rubber Large Toy For Dog & Cat",
      "price": 599.00,
      "KEY FEATURES":
          """Como toys combine a soft, velvety outer-layer with a super squeezy
Squishy foam makes como toys ultra-bouncy & a super-sensitive squeaker guarantees a squeak with every bounce.
The innovative design that is engineered to be dog-friendly
Rubber foam inner-layer that's designed to be gentle on dogs' jaws and teeth.
Not suitable for heavy chewers, and puppies who like to shred toys
Como! toys are great for dogs""",
      "images": NetworkImage(
          "https://cdn.petsworld.network/v1/s/images/0D3A8440766D5C5F84F5EBFCD45B48A3/256.webp")
    },
    {
      "names": "Petsworld Beef Steak Shape Squeaky Chew Toy for Small Dog",
      "price": 150.00,
      "KEY FEATURES":
          """Como toys combine a soft, velvety outer-layer with a super squeezy
Squishy foam makes como toys ultra-bouncy & a super-sensitive squeaker guarantees a squeak with every bounce.
The innovative design that is engineered to be dog-friendly
Rubber foam inner-layer that's designed to be gentle on dogs' jaws and teeth.
Not suitable for heavy chewers, and puppies who like to shred toys
Como! toys are great for dogs""",
      "images": NetworkImage(
          "https://cdn.petsworld.network/v1/s/images/2EADDDA8D5A8DD84639102C56863A7C0/256.webp")
    },
  ];
  List<dynamic> tick = [
    {
      "names": "Tick Free Tick & Flea Repelling Spray 200 ML",
      "price": 499.00,
      "KEY FEATURES":
          """Fleas and ticks can harm dogs in a number of ways, including skin infection, rashes, red, inflamed skin, scabs, scales, the transmission of illnesses to people, psychological problems from continual scratching, and more if they are not prevented or treated.
Tick Free can be used on pups as it is safe for the skin. The spray is evenly and optimally distributed on the surface thanks to the spray tip's distinctive delivery system.
It is safe to use every day or in between baths to efficiently maintain hygiene standards because it is sulfate- and hazardous chemical-free. The spray can act to stop the cycle of growth of ticks, fleas, and lice on your pet's coat since it even gets rid of the bugs' eggs.""",
      "images": NetworkImage(
          "https://cdn.petsworld.network/v1/s/images/EA3C89522280688D7486CD6035EC4903/256.webp")
    },
    {
      "names": "Dogzkart Anti Tick & Flea Shampoo for Cats & Dogs 200 ML",
      "price": 330.00,
      "KEY FEATURES":
          """PEST CONTROL: Kills fleas, ticks, flea eggs, flea larvae and lice.
FOR SENSITIVE SKIN: Rich, creamy, sensitive skin formula with soothing aloe, lanolin and oatmeal.
PROVEN EFFECTIVE: Contains an insect growth regulator (IGR) to kill and prevent flea development for up to 28 days.
USE ON DOGS & CATS: Safe for use on all dogs, cats, puppies and kittens 12-weeks and older.
PET, HOME & YARD: 5% of fleas live on your pet while the remaining 95% live in your home or yard. Adams provides a multi-step product solution to fight pests on every front - Complete your system with our Pet, Home, and Yard products.
Thoroughly wet your pet with warm water. Apply 1-2 tablespoons of shampoo to your pet's fur.
Work the shampoo into a lather. Let it remain on your pet for 5 minutes to kill pests.
Rinse with warm water and dry your pet off. Repeat every 7-10 days or as needed.""",
      "images": NetworkImage(
          "https://cdn.petsworld.network/v1/s/images/2713B2524091C56509759407E342B43C/1920.webp")
    },
    {
      "names":
          "Captain Zack Tick’et to Fleadom Dry Waterless Ticks Dog Shampoo 250 ml",
      "price": 352.00,
      "KEY FEATURES": """pH Balanced
No Artificial Fragrance
No Nasty Chemicals
Paraben Free
USAGE - Spray gently on the fur and massage lightly. Gently wipe to remove dirt, grime, and oil. Repeat if necessary. Dry with a soft and absorbent towel and then simply brush, comb out or blow-dry. Safe for puppies over six weeks old. DISCLAIMER: In case your pet has any underlying skin condition. Use it after Vet’s Recommendation.""",
      "images": NetworkImage(
          "https://cdn.petsworld.network/v1/s/images/C26B859B9B64D180D6229F6B14D01014/1920.webp")
    },
    {
      "names": "Virbac Clinar Pet Anti Tick Shampoo For Dogs 100 ml",
      "price": 116.00,
      "KEY FEATURES": """Eradicates ticks, fleas, and lice infestation
A complete pH balanced shampoo for all breeds
Prevents ringworm and other fungal skin diseases
Gives great relief to dogs against itching and scratching
Ideal disinfectant shampoo for all breeds of dogs""",
      "images": NetworkImage(
          "https://cdn.petsworld.network/v1/s/images/A8CD4C18CE063B122783D34518D7A32D/1920.webp")
    },
  ];
}
